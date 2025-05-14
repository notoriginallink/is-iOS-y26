import UIKit

extension DS {
    final class LabelParser: BaseParser<Label, LabelViewModel> {
        init() {
            super.init(expectedType: .label) { viewModel in
                Label(viewModel: viewModel)
            }
        }
    }
}


extension DS.LabelViewModel: DS.PayloadDecodable {
    init(payload: DS.Payload) throws {
        self.init(
            text: payload.optional("title"),
            style: try payload.requireEnum("style", as: DS.LabelViewModel.Style.self),
            size: try payload.requireEnum("size", as: DS.LabelViewModel.Size.self)
        )
    }
}
