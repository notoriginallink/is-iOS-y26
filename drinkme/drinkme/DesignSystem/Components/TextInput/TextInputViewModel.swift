import UIKit

extension DS {
    public struct TextInputViewModel {
        public enum State {
            case active
            case inactive
            case disabled
            case error
        }

        let placeholder: String
        let state: State
        let isSecure: Bool = false
        let title: String? = nil
        let value: String? = nil
        let errorMessage: String? = nil
        let description: String? = nil
    }
}