import UIKit

extension DS {
    final class TextInput: UIView {
        // MARK: - Properties
        private var onTextEditedAction: (() -> Void)?
        
        // MARK: - Subviews
        private let textField = UITextField()
        private let titleLabel = DS.Label()
        private let descriptionLabel = DS.Label()
        private let errorLabel = DS.Label()

        // MARK: - Init
        init(viewModel: TextInputViewModel) {
            super.init(frame: .zero)
            setupViews()
            setupConstraints()
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
            
            textField.addTarget(self, action: #selector(textEdited), for: .editingChanged)
        }
        
        private func setupConstraints() {
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: topAnchor),
                
                descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
                
                textField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
                textField.leadingAnchor.constraint(equalTo: leadingAnchor),
                textField.trailingAnchor.constraint(equalTo: trailingAnchor),
                textField.heightAnchor.constraint(equalToConstant: 44),
                
                errorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor)
            ])
        }

        // MARK: - Config
        func configure(with viewModel: TextInputViewModel) {
            if let title = viewModel.title {
                titleLabel.isHidden = false
                titleLabel.configure(with: .init(
                    text: title,
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
                    style: .secondary,
                    size: .small,
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
                textField.layer.borderColor = Colors.basic.cgColor
            case .inactive:
                textField.layer.borderColor = Colors.dark.cgColor
            case .disabled:
                textField.isEnabled = false
                textField.alpha = 0.8
                textField.isUserInteractionEnabled = false
            case .error:
                if let error = viewModel.errorMessage {
                    errorLabel.isHidden = false
                    errorLabel.configure(with: .init(
                        text: error,
                        style: .error,
                        size: .small,
                    ))
                    textField.layer.borderColor = Colors.red.cgColor
                }
            }
        }
        
        // MARK: - Getter
        func getCurrentValue() -> String {
            return textField.text ?? ""
        }
        
        // MARK: - Actions
        func setOnEditedAction(_ action: @escaping () -> Void) {
            onTextEditedAction = action
        }
        
        @objc private func textEdited() {
            onTextEditedAction?()
        }
    }
}
