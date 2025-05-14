import UIKit

extension DS {
    public enum Icon: String {
        case x
        
        var value: UIImage {
            switch self {
            case .x:
                return UIImage(systemName: "xmark")!
            }
        }
    }
}
