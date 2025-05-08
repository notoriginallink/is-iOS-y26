import UIKit

extension DS {
    final class Label: UILabel {
        // MARK: - Init
        init() {
            super.init(frame: .zero)
            setupLabel()
        }
        
        init(viewModel: DS.LabelViewModel) {
            super.init(frame: .zero)
            setupLabel()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Setup
        private func setupLabel() {
            // TODO: Возможно эти свойства вынести в настройку через style
            numberOfLines = 0
            lineBreakMode = .byWordWrapping
        }
        
        // MARK: - Config
        func configure(with viewModel: DS.LabelViewModel) {
            text = viewModel.text
            
            switch viewModel.size {
            case .small:
                font = Typography.small
            case .medium:
                font = Typography.medium
            case .large:
                font = Typography.large
            }
            
            switch viewModel.style {
            case .primary:
                textAlignment = .left
                textColor = Colors.dark
            case .secondary:
                textAlignment = .left
                textColor = Colors.basic
            case .success:
                textAlignment = .center
                textColor = Colors.light
            case .error:
                textAlignment = .center
                textColor = Colors.red
            }
        }
    }
}
