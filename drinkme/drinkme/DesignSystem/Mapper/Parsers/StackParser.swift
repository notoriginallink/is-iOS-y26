import UIKit

extension DS {
    final class StackParser: BaseParser<Stack, StackViewModel>, MapperDependentParser {
        weak var mapper: MapperProtocol?
        
        init(mapper: MapperProtocol? = nil) {
            self.mapper = mapper
            super.init(expectedType: .stack) { viewModel in
                Stack(viewModel: viewModel)
            }
        }
        
        override func tryParse(from model: DS.Model) throws -> UIView {
            guard conforms(model: model) else {
                throw ParsingError.unsupportedType(model.type.rawValue)
            }
            
            let viewModel = try StackViewModel(payload: model.payload)
            let stack = DS.Stack(viewModel: viewModel)
            
            if let subviews = model.subviews, let mapper = mapper {
                for subviewModel in subviews {
                    let subview = try mapper.map(from: subviewModel)
                    stack.addArrangedSubview(subview)
                }
            }
            
            return stack
        }
        
    }
}

extension DS.StackViewModel: DS.PayloadDecodable {
    init(payload: DS.Payload) throws {
        self.init(
            spacing: try payload.requireEnum("spacing", as: DS.Spacing.self),
            axis: try payload.requireEnum("axic", as: DS.StackViewModel.Axis.self),
            alignment: try UIStackView.alignment(from: payload.optional("alignment")),
            distribution: try UIStackView.distribution(from: payload.optional("distribution")),
            insets: try payload.tryGetInsets("insets"))
    }
}

extension UIStackView {
    static func alignment(from string: String?) throws -> Alignment {
        guard let string = string else {
            return .fill
        }
        switch string.lowercased() {
        case "fill": return .fill
        case "leading": return .leading
        case "top": return .top
        case "center": return .center
        default: throw DS.ParsingError.invalidEnumValue(key: "alignment", value: string)
        }
    }
    
    static func distribution(from string: String?) throws -> Distribution {
        guard let string = string else {
            return .fill
        }
        switch string.lowercased() {
        case "fill": return .fill
        case "fillEqually": return .fillEqually
        case "fillProportionally": return .fillProportionally
        default: throw DS.ParsingError.invalidEnumValue(key: "distribution", value: string)
        }
    }
}
