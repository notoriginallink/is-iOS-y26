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
        
        // configure login button
        authView.loginButton.configure(with: DS.ButtonViewModel(
            title: "Войти",
            style: .primary,
            size: .large,
            state: viewModel.isLoading ? .inactive : .active))
        
        // configure error label
        authView.errorLabel.text = viewModel.errorMessage
        authView.errorLabel.configure(with: DS.LabelViewModel.init(
            text: viewModel.errorMessage,
            style: .error,
            size: .medium))
        
        setLoading(viewModel.isLoading)
    }
    
    // MARK: - Bindings
    private func setupBindings() {
        viewModel.onStateChanged = { [weak self] in
            self?.updateUI()
        }
        
        viewModel.onLoginSuccess = { [weak self] in
            self?.loginSuccessful()
        }
        
        authView.loginButton.setTapAction{[weak self] in self?.loginButtonTapped()}
        authView.registerButton.setTapAction { [weak self] in self?.registerButtonTapped()}
        authView.closeButton.setTapAction{ [weak self] in self?.closeButtonTapped()}
        authView.usernameTextField.addTarget(self, action: #selector(usernameChanged), for: .editingChanged)
        authView.passwordTextField.addTarget(self, action: #selector(passwordChanged), for: .editingChanged)
    }
    
    @objc private func usernameChanged() {
        viewModel.authContext.username = authView.usernameTextField.text ?? ""
    }

    @objc private func passwordChanged() {
        viewModel.authContext.password = authView.passwordTextField.text ?? ""
    }
    
    private func loginButtonTapped() {
        viewModel.login()
    }
    
    private func registerButtonTapped() {
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
            authView.loginButton.configure(with: DS.ButtonViewModel(
                title: "Войти",
                style: .primary,
                size: .large,
                state: .inactive))
        } else {
            authView.loadingIndicator.stopAnimating()
            authView.loadingIndicator.isHidden = true
            authView.loginButton.configure(with: DS.ButtonViewModel(
                title: "Войти",
                style: .primary,
                size: .large,
                state: .active))
        }
    }
    
    func loginSuccessful() {
        coordinator?.authenticationDidComplete()
    }
}

