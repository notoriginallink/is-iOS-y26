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
                self.configuration?.contentInsets = NSDirectionalEdgeInsets(top: DS.Spacing.xs, leading: DS.Spacing.s, bottom: DS.Spacing.xs, trailing: DS.Spacing.s)
                titleLabel?.font = DS.Typography.small
            case .medium:
                self.configuration?.contentInsets = NSDirectionalEdgeInsets(top: DS.Spacing.s, leading: DS.Spacing.m, bottom: DS.Spacing.s, trailing: DS.Spacing.m)
                titleLabel?.font = DS.Typography.medium
            case .large:
                self.configuration?.contentInsets = NSDirectionalEdgeInsets(top: DS.Spacing.m, leading: DS.Spacing.l, bottom: DS.Spacing.m, trailing: DS.Spacing.l)
                titleLabel?.font = DS.Typography.large
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
