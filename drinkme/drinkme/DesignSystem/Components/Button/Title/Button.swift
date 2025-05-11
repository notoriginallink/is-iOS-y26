import UIKit

extension DS {
    final class Button: UIButton {
        // MARK: - Properties
        private var onTap: (() -> Void)?
        
        // MARK: - Init
        init(viewModel: DS.ButtonViewModel) {
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
            layer.cornerRadius = 8
        }
        
        // MARK: - Config
        func configure(with viewModel: DS.ButtonViewModel) {
            setTitle(viewModel.title, for: .normal)
            
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
                backgroundColor = DS.Colors.basic
                setTitleColor(DS.Colors.white, for: .normal)
            case .neutral:
                backgroundColor = DS.Colors.light
                setTitleColor(DS.Colors.white, for: .normal)
            case .subtle:
                setTitleColor(DS.Colors.light, for: .normal)
            }
            
            switch viewModel.size {
            case .small:
                self.configuration?.contentInsets = NSDirectionalEdgeInsets(
                    top: DS.Spacing.xs.value,
                    leading: DS.Spacing.s.value,
                    bottom: DS.Spacing.xs.value,
                    trailing: DS.Spacing.s.value)
                titleLabel?.font = DS.Typography.small
                NSLayoutConstraint.activate([
                    heightAnchor.constraint(equalToConstant: 32)
                ])
            case .medium:
                self.configuration?.contentInsets = NSDirectionalEdgeInsets(
                    top: DS.Spacing.s.value,
                    leading: DS.Spacing.m.value,
                    bottom: DS.Spacing.s.value,
                    trailing: DS.Spacing.m.value)
                titleLabel?.font = DS.Typography.medium
                NSLayoutConstraint.activate([
                    heightAnchor.constraint(equalToConstant: 50)
                ])
            case .large:
                self.configuration?.contentInsets = NSDirectionalEdgeInsets(
                    top: DS.Spacing.m.value,
                    leading: DS.Spacing.l.value,
                    bottom: DS.Spacing.m.value,
                    trailing: DS.Spacing.l.value)
                titleLabel?.font = DS.Typography.large
                NSLayoutConstraint.activate([
                    heightAnchor.constraint(equalToConstant: 64)
                ])
            }
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
