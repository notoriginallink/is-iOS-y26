import UIKit

class AuthViewController: UIViewController, AuthViewProtocol {
    
    // MARK: - Properties
    private var viewModel: AuthViewModelProtocol
    private weak var coordinator: AuthCoordinatorProtocol?
    private var authView: AuthView {
        return view as! AuthView
    }
    
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
    override func loadView() {
        view = AuthView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    // MARK: - UI
    private func updateUI() {
        authView.usernameTextField.text = viewModel.authContext.username
        authView.passwordTextField.text = viewModel.authContext.password
        authView.loginButton.isEnabled = !viewModel.isLoading
        authView.errorLabel.text = viewModel.errorMessage
        setLoading(viewModel.isLoading)
    }
    
    // MARK: - Bindings
    private func setupBindings() {
        viewModel.onStateChanged = { [weak self] in
            self?.updateUI()
        }

        viewModel.onLoginSuccess = { [weak self] in
            print("[DEBUG]: Logged in successfully ") // TODO: debug info, remove later
            self?.loginSuccessful()
        }
        
        authView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        authView.registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        authView.closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        authView.usernameTextField.addTarget(self, action: #selector(usernameChanged), for: .editingChanged)
        authView.passwordTextField.addTarget(self, action: #selector(passwordChanged), for: .editingChanged)
    }
    
    @objc private func usernameChanged() {
        viewModel.authContext.username = authView.usernameTextField.text ?? ""
    }

    @objc private func passwordChanged() {
        viewModel.authContext.password = authView.passwordTextField.text ?? ""
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
    
    // MARK: - Methods
    func setLoading(_ isLoading: Bool) {
        if (isLoading) {
            authView.loadingIndicator.startAnimating()
            authView.loadingIndicator.isHidden = false
            authView.loginButton.isEnabled = false
            authView.loginButton.backgroundColor = .medium
            
        } else {
            authView.loadingIndicator.stopAnimating()
            authView.loadingIndicator.isHidden = true
            authView.loginButton.isEnabled = true
            authView.loginButton.backgroundColor = .light
        }
    }
    
    func showError(message: String) {
        authView.errorLabel.text = message
    }
    
    func updateLoginButton(isEnabled: Bool) {
        authView.loginButton.isEnabled = isEnabled
    }
    
    func loginSuccessful() {
        coordinator?.authenticationDidComplete()
    }
}

