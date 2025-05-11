import Foundation

extension DS {
    public enum Spacing {
        case none
        case xs
        case s
        case m
        case l
        case xl
        
        var value: CGFloat {
            switch self {
            case .none: return 0
            case .s: return 4
            case .xs: return 8
            case .m: return 16
            case .l: return 24
            case .xl: return 32
            }
        }
    }
}
