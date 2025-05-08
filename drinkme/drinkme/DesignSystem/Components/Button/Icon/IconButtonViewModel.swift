import UIKit

extension DS {
    public struct IconButtonViewModel {
        public enum Style {
            case primary
            case subtle
        }
        
        public enum State {
            case active
            case inactive
        }
        
        public enum Size {
            case medium
            case small
        }
        
        let icon: UIImage
        let size: Size
        let style: Style
        let state: State
    }
}
