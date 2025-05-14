import UIKit

extension DS {
    public struct ButtonViewModel {
        public enum Style: String {
            case primary
            case neutral
            case subtle
        }
        
        public enum Size: String {
            case small
            case medium
            case large
        }
        
        public enum State: String {
            case active
            case inactive
        }
        
        let title: String
        let style: Style
        let size: Size
        let state: State
    }
}
