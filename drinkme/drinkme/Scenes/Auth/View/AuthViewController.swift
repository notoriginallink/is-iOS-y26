import UIKit

class AuthViewController: UIViewController, AuthViewProtocol {
    
    // MARK: - Properties
    private var viewModel: AuthViewModelProtocol
    private var coordinator: AuthCoordinatorProtocol
    
    // Впоследствии планирую сделать аутентификацию необязательной, поэтому есть кнопка выхода
    private let closeButton = UIButton(type: .system)
    private let logo = UIImageView()
    private let usernameTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton(type: .system)
    private let registerButton = UIButton(type: .system)
    // Пока он не используется, так как по сути нечего ждать (нет асинхронных операций), потом появится
    private let loadingIndicator = UIActivityIndicatorView(style: .medium)
    private let errorLabel = UILabel()
    
    // MARK: - Initializers
    init(viewModel: AuthViewModelProtocol, coordinator: AuthCoordinatorProtocol) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    // MARK: - UI setup
    private func setupUI() {
        view.backgroundColor = .dark
        
        // closeButton
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .smokewhite
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(closeButton)
        
        // logo
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFit
        logo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logo)
        
        // email input
        usernameTextField.placeholder = "Имя пользователя"
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.autocapitalizationType = .none
        usernameTextField.autocorrectionType = .no
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)
        
        // password
        passwordTextField.placeholder = "Пароль"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        // login button
        loginButton.setTitle("Войти", for: .normal)
        loginButton.setTitleColor(.smokewhite, for: .normal)
        loginButton.backgroundColor = .light
        loginButton.layer.cornerRadius = 10
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        // register button
        registerButton.setTitle("Создать аккаунт", for: .normal)
        registerButton.setTitleColor(.light, for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerButton)
        
        // errorLabel
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textColor = .red
        errorLabel.font = UIFont.systemFont(ofSize: 14)
        errorLabel.numberOfLines = 0
        errorLabel.lineBreakMode = .byWordWrapping
        errorLabel.textAlignment = .center
        view.addSubview(errorLabel)
        
        // loading indicator
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingIndicator)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            logo.heightAnchor.constraint(equalToConstant: 120),
            
            usernameTextField.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 70),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            usernameTextField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            errorLabel.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            loadingIndicator.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor),
        ])
    }
    
    // MARK: - Bindings
    private func setupBindings() {
        viewModel.onStateChanged = { [weak self] in
            self?.updateUI()
        }

        viewModel.onLoginSuccess = { [weak self] in
            print("[DEBUG]: Logged in successfully ") // TODO: debug info, remove later
            self?.navigateToCocktailList()
        }
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        usernameTextField.addTarget(self, action: #selector(usernameChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordChanged), for: .editingChanged)
    }
    
    @objc private func usernameChanged() {
        viewModel.username = usernameTextField.text ?? ""
    }

    @objc private func passwordChanged() {
        viewModel.password = passwordTextField.text ?? ""
    }
    
    @objc private func loginButtonTapped() {
        viewModel.login()
    }
    
    @objc private func registerButtonTapped() {
        print("[DEBUG]: Registry button clicked") // TODO: Добавить переход на экран регистрации
    }
    
    @objc private func closeButtonTapped() {
        print("[DEBUG]: Close button clicked") // TODO: Добавить закрытие экрана авторизации
    }
    
    private func updateUI() {
        usernameTextField.text = viewModel.username
        passwordTextField.text = viewModel.password
        loginButton.isEnabled = !viewModel.isLoading
        errorLabel.text = viewModel.errorMessage
        setLoading(viewModel.isLoading)
    }
    
    // MARK: Helper methods
    func setLoading(_ isLoading: Bool) {
        isLoading ? loadingIndicator.startAnimating() : loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = !isLoading
    }
    
    func showError(message: String) {
        errorLabel.text = message
    }
    
    func updateLoginButton(isEnabled: Bool) {
        loginButton.isEnabled = isEnabled
    }
    
    func navigateToCocktailList() {
        coordinator.goToCocktailList()
    }
}
