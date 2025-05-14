import Foundation

extension DS {
    enum ParsingError: LocalizedError {
        case unsupportedType(_ type: String)
        case missingRequiredProperty(_ name: String)
        case missingPayload
        case invalidEnumValue(key: String, value: String)
        
        var errorDescription: String? {
            switch self {
            case .unsupportedType(let type):
                return "Model of unsupported type \(type)"
            case .missingRequiredProperty(let name):
                return "Could not find required property \(name)"
            case .missingPayload:
                return "Payload is missing"
            case .invalidEnumValue(let key, let value):
                return "Unexpected value: \(value) in enum property \"\(key)\""
            }
        }
    }
}
