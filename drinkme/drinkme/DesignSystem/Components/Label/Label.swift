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
            textAlignment = .center
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
                textColor = Colors.dark
            case .secondary:
                textColor = Colors.basic
            case .success:
                textColor = Colors.light
            case .error:
                textColor = Colors.red
            }
        }
    }
}
