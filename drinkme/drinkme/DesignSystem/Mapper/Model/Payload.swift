import UIKit

extension DS {
    struct Payload: Decodable {
        // MARK: - Properties
        private let raw: [String: Any]
        
        // MARK: - Init
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let data = try container.decode(Data.self)
            guard
                let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Expected dictionary")
            }
            self.raw = jsonObject
        }

        init(_ raw: [String: Any]) {
            self.raw = raw
        }
        
        // MARK: - Methods
        func optional(_ key: String) -> String? {
            return raw[key] as? String
        }
        
        func optionalEnum<E: RawRepresentable>(_ key: String, as type: E.Type) throws -> E? where E.RawValue == String {
            guard let rawValue = optional(key) else {
                return nil
            }
            guard let value = E(rawValue: rawValue) else {
                throw ParsingError.invalidEnumValue(key: key, value: rawValue)
            }
            
            return value
        }
        
        func require(_ key: String) throws -> String {
            guard let value = raw[key] as? String else {
                throw ParsingError.missingRequiredProperty(key)
            }
            return value
        }
        
        func optional<T: Decodable>(_ key: String, as type: T.Type = T.self) throws -> T? {
            guard let value = raw[key] else {
                return nil
            }
            
            let data = try JSONSerialization.data(withJSONObject: value, options: [])
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        }
        
        func require<T: Decodable>(_ key: String, as type: T.Type = T.self) throws -> T {
            guard let decoded = try optional(key, as: T.self) else {
                throw ParsingError.missingRequiredProperty(key)
            }
            
            return decoded
        }
        
        func requireEnum<E: RawRepresentable>(_ key: String, as type: E.Type) throws -> E where E.RawValue == String {
            let rawValue = try require(key)
            guard let value = E(rawValue: rawValue) else {
                throw ParsingError.invalidEnumValue(key: key, value: rawValue)
            }
            
            return value
        }
        
        func getNestedPayload(_ key: String) throws -> Payload {
            guard let nested = raw[key] as? [String: Any] else {
                throw ParsingError.missingRequiredProperty(key)
            }
            return Payload(nested)
        }
        
        func tryGetInsets(_ key: String) throws -> UIEdgeInsets? {
            guard let nestedRaw = raw[key] as? [String: Any] else {
                return nil
            }
            let nested = Payload(nestedRaw)
            let top = try nested.require("top", as: CGFloat.self)
            let left = try nested.require("left", as: CGFloat.self)
            let bottom = try nested.require("bottom", as: CGFloat.self)
            let right = try nested.require("right", as: CGFloat.self)
            return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        }
    }
}
