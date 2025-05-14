import UIKit

extension DS {
    final class TextButtonParser: BaseParser<Button, ButtonViewModel> {
        init() {
            super.init(expectedType: .textInput) { viewModel in
                Button(viewModel: viewModel)
            }
        }
    }
}

extension DS.ButtonViewModel: DS.PayloadDecodable {
    init(payload: DS.Payload) throws {
        self.init(
            title: try payload.require("title"),
            style: try payload.requireEnum("style", as: DS.ButtonViewModel.Style.self),
            size: try payload.requireEnum("size", as: DS.ButtonViewModel.Size.self),
            state: try payload.requireEnum("state", as: DS.ButtonViewModel.State.self)
        )
    }
}
