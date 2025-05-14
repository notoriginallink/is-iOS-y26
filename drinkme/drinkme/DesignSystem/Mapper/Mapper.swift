import UIKit

extension DS {
    final class Mapper: MapperProtocol {
        
        // MARK: - Dependencies
        private let parsers: [Parser]
        
        // MARK: - Init
        init(parsers: [Parser]) {
            self.parsers = parsers
        }
        
        // MARK: Mapping
        func map(from model: Model) throws -> UIView {
            for parser in parsers {
                if parser.conforms(model: model) {
                    return try parser.tryParse(from: model)
                }
            }
            
            throw MappingError.parserNotFound(model.type.rawValue)
        }
    }
}
