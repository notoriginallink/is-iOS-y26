import UIKit

extension DS {
    public struct IconButtonViewModel {
        public enum Style: String {
            case primary
            case subtle
        }
        
        public enum State: String {
            case active
            case inactive
        }
        
        public enum Size: String {
            case medium
            case small
        }
        
        let icon: UIImage
        let size: Size
        let style: Style
        let state: State
    }
}
