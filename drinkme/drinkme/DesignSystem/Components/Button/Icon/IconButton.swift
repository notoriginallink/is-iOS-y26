import UIKit

extension DS {
    final class IconButton: UIButton {
        // MARK: - Properties
        private var onTap: (() -> Void)?
        
        // MARK: - Init
        init(viewModel: DS.IconButtonViewModel) {
            super.init(frame: .zero)
            setupButton()
            configure(with: viewModel)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Setup
        private func setupButton() {
            addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            layer.cornerRadius = 5
        }
        
        // MARK: - Config
        func configure(with viewModel: DS.IconButtonViewModel) {
            setImage(DS.Icon.x, for: .normal)
            
            switch viewModel.state {
            case .active:
                isEnabled = true
                alpha = 1
            case .inactive:
                isEnabled = false
                alpha = 0.5
            }
            
            switch viewModel.style {
            case .primary:
                backgroundColor = DS.Colors.dark
                tintColor = DS.Colors.white
            case .subtle:
                tintColor = DS.Colors.white
            }
            
            let padding: CGFloat
            switch viewModel.size {
            case .small:
                padding = DS.Spacing.xs
            case .medium:
                padding = DS.Spacing.s
            }

            imageView?.contentMode = .scaleAspectFit
            self.configuration?.contentInsets = NSDirectionalEdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding)
        }

        // MARK: - Actions
        func setTapAction(_ action: @escaping () -> Void) {
            onTap = action
        }
        
        @objc private func buttonTapped() {
            onTap?()
        }
    }
}
