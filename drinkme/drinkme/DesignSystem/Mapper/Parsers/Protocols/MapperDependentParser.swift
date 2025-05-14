import Foundation

extension DS {
    protocol MapperDependentParser: Parser {
        var mapper: MapperProtocol? { get set }
    }
}
