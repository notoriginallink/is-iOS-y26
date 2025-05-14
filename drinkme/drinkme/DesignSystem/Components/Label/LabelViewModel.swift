import UIKit

extension DS {
    public struct LabelViewModel {
        public enum Style: String {
            case primary
            case secondary
            case error
            case success
        }
        
        public enum Size: String {
            case small
            case medium
            case large
        }
        
        let text: String?
        let style: Style
        let size: Size
    }
}
