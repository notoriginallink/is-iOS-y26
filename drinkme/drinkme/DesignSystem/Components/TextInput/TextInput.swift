import UIKit

extension DS {
    final class TextInput: UIView {
        // MARK: - Subviews
        private let textField = UITextField()
        private let titleLabel = DS.Label()
        private let descriptionLabel = DS.Label()
        private let errorLabel = DS.Label()

        // MARK: - Init
        init(viewModel: TextInputViewModel) {
            super.init(frame: .zero)
            setupViews()
            configure(with: viewModel)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: - Setup
        private func setupViews() {
            [titleLabel, textField, descriptionLabel, errorLabel].forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                addSubview($0)
            }
            textField.borderStyle = .roundedRect
            textField.autocapitalizationType = .none
            textField.autocorrectionType = .no
        }

        // MARK: - Config
        func configure(with viewModel: TextInputViewModel) {
            if let title = viewModel.title {
                titleLabel.isHidden = false
                titleLabel.configure(with: .init(
                    text: viewModel.label,
                    style: .primary,
                    size: .medium
                ))  
            } else {
                titleLabel.isHidden = true
            }
            

            if let description = viewModel.description {
                descriptionLabel.isHidden = false
                descriptionLabel.configure(with: .init(
                    text: description,
                    size: .small,
                    style: .secondary
                ))
            } else {
                descriptionLabel.isHidden = true
            }

            textField.placeholder = viewModel.placeholder
            textField.isSecureTextEntry = viewModel.isSecure
            textField.text = viewModel.value

            errorLabel.isHidden = true
            textField.isUserInteractionEnabled = true
            textField.isEnabled = true
            textField.alpha = 1.0
            textField.layer.borderWidth = 1
            switch viewModel.state {
            case .active:
                textFiled.layer.borderColor = Colors.basic
            case .inactive:
                textField.layer.borderColor = Colors.dark
            case .disabled:
                textField.isEnabled = false
                textField.alpha = 0.8
                textField.isUserInteractionEnabled = false
            case .error:
                if let error = viewModel.errorMessage {
                    errorLabel.isHidden = false
                    errorLabel.configure(with: .init(
                        text: error,
                        size: .small,
                        style: .error
                    ))
                    textField.layer.borderColor = Colors.red.cgColor
                }
            }
        }
    }
}