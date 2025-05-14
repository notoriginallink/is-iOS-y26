import UIKit

extension DS {
    class BaseParser<View: UIView, ViewModel: PayloadDecodable>: Parser {
        
        let expectedType: ModelType
        let build: (ViewModel) -> View
        
        init(expectedType: ModelType, build: @escaping (ViewModel) -> View) {
            self.expectedType = expectedType
            self.build = build
        }
        
        func conforms(model: DS.Model) -> Bool {
            return model.type == expectedType
        }
        
        func tryParse(from model: DS.Model) throws -> UIView {
            guard conforms(model: model) else {
                throw ParsingError.unsupportedType(model.type.rawValue)
            }
            
            return build(try ViewModel(payload: model.payload))
        }
    }
}
