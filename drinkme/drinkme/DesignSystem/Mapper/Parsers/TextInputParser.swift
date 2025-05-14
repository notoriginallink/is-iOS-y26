import UIKit

extension DS {
    final class TextInputParser: BaseParser<TextInput, TextInputViewModel> {
        init() {
            super.init(expectedType: .textInput) { viewModel in
                TextInput(viewModel: viewModel)
            }
        }
    }
}

extension DS.TextInputViewModel: DS.PayloadDecodable {
    init(payload: DS.Payload) throws {
        self.init(
            placeholder: try payload.require("placeholder"),
            state: try payload.requireEnum("state", as: DS.TextInputViewModel.State.self),
            isSecure: try payload.require("secured", as: Bool.self),
            title: payload.optional("title"),
            value: payload.optional("value"),
            errorMessage: payload.optional("errorMessage"),
            description: payload.optional("description"))
    }
}
