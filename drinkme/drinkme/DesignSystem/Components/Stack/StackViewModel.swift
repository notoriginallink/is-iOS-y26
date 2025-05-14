import UIKit

extension DS {
    public struct StackViewModel {
        public enum Axis: String {
            case vertical
            case horizontal
        }
        
        let spacing: Spacing
        let axis: Axis
        public let alignment: UIStackView.Alignment
        public let distribution: UIStackView.Distribution
        public let insets: UIEdgeInsets?

        public init(
            spacing: Spacing = .m,
            axis: Axis = .vertical,
            alignment: UIStackView.Alignment = .fill,
            distribution: UIStackView.Distribution = .fill,
            insets: UIEdgeInsets? = nil
        ) {
            self.spacing = spacing
            self.axis = axis
            self.alignment = alignment
            self.distribution = distribution
            self.insets = insets
        }
    }
}
