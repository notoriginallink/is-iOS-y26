class AuthViewModel: AuthViewModelProtocol {
    
    // MARK: - Properties
    var username: String = "" {
        didSet { onStateChanged?() }
    }
    
    var password: String = "" {
        didSet { onStateChanged?() }
    }
    
    private(set) var isLoading: Bool = false {
        didSet { onStateChanged?() }
    }
    
    private(set) var errorMessage: String? {
        didSet { onStateChanged?() }
    }
    
    var onStateChanged: (() -> Void)?
    
    var onLoginSuccess: (() -> Void)?
    
    private let authService: AuthServiceProtocol
    
    // MARK: - Initializer
    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }
    
    // MARK: - Functions
    func login() {
        guard validateInput() else {
            errorMessage = "Неверный формат ввода"
            return
        }

        authService.login(username: username, password: password, completion: {result in
            if (result) {
                self.onLoginSuccess?()
            } else {
                self.errorMessage = "Пароль или логин неверны"
            }
        })
    }
    
    func validateInput() -> Bool {
        let usernameValid = username.isValidLength(leftBound: 3, rigthBound: 20) && username.isAlphanumeric
        let passwordValid = password.isValidLength(leftBound: 6, rigthBound: 20)
        return usernameValid && passwordValid
    }
}


// MARK: - String extensions
extension String {
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}

extension String {
    func isValidLength(leftBound: Int, rigthBound: Int) -> Bool {
        return count >= leftBound && count <= rigthBound
    }
}
