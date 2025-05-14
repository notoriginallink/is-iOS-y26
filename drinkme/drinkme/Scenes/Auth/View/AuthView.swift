import UIKit

class AuthView: UIView {
    
    // MARK: - Subviews
    var logo = UIImageView()
    var closeButton = DS.IconButton(viewModel: DS.IconButtonViewModel(
        icon: DS.Icon.x.value,
        size: .medium,
        style: .subtle,
        state: .active))
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
    var loginButton = DS.Button(viewModel: DS.ButtonViewModel(
        title: "Войти",
        style: .primary,
        size: .medium,
        state: .active))
    var registerButton = DS.Button(viewModel: DS.ButtonViewModel(
        title: "Создать аккаунт",
        style: .subtle,
        size: .medium,
        state: .active))
    var errorLabel = DS.Label()
    var loadingIndicator = UIActivityIndicatorView(style: .medium)

    private let stack: DS.Stack = .init(viewModel: DS.StackViewModel(
        spacing: .m,
        axis: .vertical,
        alignment: .fill,
        distribution: .fill,
        insets: UIEdgeInsets(
            top: DS.Spacing.none.value,
            left: DS.Spacing.l.value,
            bottom: DS.Spacing.none.value,
            right: DS.Spacing.l.value)
    ))
    
    // MARK: - Init
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
        
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFit
        loadingIndicator.hidesWhenStopped = true

        stack.addArrangedSubview(usernameTextField)
        stack.addArrangedSubview(passwordTextField)
        stack.addArrangedSubview(loginButton)
        stack.addArrangedSubview(registerButton)
        stack.addArrangedSubview(errorLabel)

        [closeButton, logo, stack, loadingIndicator].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: DS.Spacing.m.value),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DS.Spacing.l.value),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30),

            logo.centerXAnchor.constraint(equalTo: centerXAnchor),
            logo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            logo.heightAnchor.constraint(equalToConstant: 120),

            stack.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 60),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            loadingIndicator.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor),
        ])
    }
}
