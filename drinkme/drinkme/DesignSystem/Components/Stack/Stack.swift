import UIKit

extension DS {
    final class Stack: UIStackView {
        // MARK: - Init
        init() {
            super.init(frame: .zero)
            setupStack()
        }
        
        init(viewModel: DS.StackViewModel) {
            super.init(frame: .zero)
            setupStack()
            configure(with: viewModel)
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Setup
        private func setupStack() {
            translatesAutoresizingMaskIntoConstraints = false
        }

        // MARK: - Config
        func configure(with viewModel: DS.StackViewModel) {
            spacing = viewModel.spacing.value
            axis = (viewModel.axis == .vertical) ? .vertical : .horizontal
            alignment = viewModel.alignment
            distribution = viewModel.distribution

            if let insets = viewModel.insets {
                isLayoutMarginsRelativeArrangement = true
                layoutMargins = insets
            } else {
                isLayoutMarginsRelativeArrangement = false
            }
        }
    }
}
