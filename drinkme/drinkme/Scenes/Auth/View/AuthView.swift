import UIKit

class AuthView: UIView {
    
    // MARK: - Subviews
    var logo = UIImageView()
    var usernameTextField = DS.TextInput(viewModel: .init(
        placeholder: "Имя пользователя",
        state: .active,
        isSecure: false,
        title: nil, value: nil, errorMessage: nil, description: nil))
    var passwordTextField = DS.TextInput(viewModel: .init(
        placeholder: "Пароль",
        state: .active,
        isSecure: true,
        title: nil, value: nil, errorMessage: nil, description: nil))
    var closeButton = DS.IconButton(viewModel: DS.IconButtonViewModel(
        icon: DS.Icon.x,
        size: .medium,
        style: .subtle,
        state: .active))
    var loginButton = DS.Button(viewModel: DS.ButtonViewModel(
        title: "Войти",
        style: .primary,
        size: .large,
        state: .active))
    var registerButton = DS.Button(viewModel: DS.ButtonViewModel(
        title: "Создать аккаунт",
        style: .subtle,
        size: .medium,
        state: .active))
    var errorLabel = DS.Label()
    var loadingIndicator = UIActivityIndicatorView(style: .medium)
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setup() {
        backgroundColor = .dark

        [closeButton, logo, usernameTextField, passwordTextField, loginButton, registerButton, errorLabel, loadingIndicator].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        // logo
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFit
        
        // loading indicator
        loadingIndicator.hidesWhenStopped = true
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            
            logo.centerXAnchor.constraint(equalTo: centerXAnchor),
            logo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            logo.heightAnchor.constraint(equalToConstant: 120),
            
            usernameTextField.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 70),
            usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            usernameTextField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            errorLabel.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
            errorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            loadingIndicator.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor),
        ])
    }
}
