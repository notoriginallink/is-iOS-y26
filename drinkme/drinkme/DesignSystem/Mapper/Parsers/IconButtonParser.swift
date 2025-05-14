import UIKit

extension DS {
    final class IconButtonParser: BaseParser<IconButton, IconButtonViewModel> {
        init() {
            super.init(expectedType: .iconButton) { viewModel in
                    IconButton(viewModel: viewModel)
            }
        }
    }
}

extension DS.IconButtonViewModel: DS.PayloadDecodable {
    init(payload: DS.Payload) throws {
        self.init(
            icon: try payload.requireEnum("icon", as: DS.Icon.self).value,
            size: try payload.requireEnum("size", as: DS.IconButtonViewModel.Size.self),
            style: try payload.requireEnum("style", as: DS.IconButtonViewModel.Style.self),
            state: try payload.requireEnum("state", as: DS.IconButtonViewModel.State.self))
    }
}
