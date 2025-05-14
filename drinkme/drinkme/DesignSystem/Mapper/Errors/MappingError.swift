import Foundation

extension DS {
    enum MappingError: LocalizedError {
        case parserNotFound(_ type: String)
        
        var errorDescription: String? {
            switch self {
            case .parserNotFound(let type):
                return "Parser for model type \(type) not found"
            }
        }
    }
}
