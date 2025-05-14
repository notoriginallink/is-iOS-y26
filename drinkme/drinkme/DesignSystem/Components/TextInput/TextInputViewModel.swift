import UIKit

extension DS {
    public struct TextInputViewModel {
        public enum State: String {
            case active
            case inactive
            case disabled
            case error
        }

        let placeholder: String
        let state: State
        let isSecure: Bool
        let title: String?
        let value: String?
        let errorMessage: String?
        let description: String?
    }
}
