import UIKit

extension DS {
    public struct LabelViewModel {
        public enum Style {
            case primary
            case secondary
            case error
            case success
        }
        
        public enum Size {
            case small
            case medium
            case large
        }
        
        let text: String?
        let style: Style
        let size: Size
    }
}
