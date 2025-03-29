class AuthViewModel: AuthViewModelProtocol {
    
    // MARK: - Properties
    var username: String = "";
    var password: String = "";
    
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
        var (isValid, error) = validateUsername()
        guard isValid else {
            errorMessage = error
            return
        }
        
        (isValid, error) = validatePassword()
        guard isValid else {
            errorMessage = error
            return
        }
        
        isLoading = true
        errorMessage = nil

        authService.login(username: username, password: password, completion: { [weak self] result in
            guard let self = self else { return }
            
            self.isLoading = false
            if (result) {
                self.onLoginSuccess?()
            } else {
                self.errorMessage = "Неверный пароль"
            }
        })
    }
    
    func validateUsername() -> (Bool, String?) {
        if (username.isEmpty) {
            return (false, "Введите имя пользователя")
        }
        
        if (!username.isAlphanumeric) {
            return (false, "Имя пользователя может содержать только буквы и цифры")
        }
        
        // TODO: Проверка в базе данных, что пользователь с таким именем существует
        if (false) {
            return (false, "Пользователь с таким именем не найден")
        }
        
        return (true, nil)
    }
    
    func validatePassword() -> (Bool, String?) {
        if (password.isEmpty) {
            return (false, "Введите пароль")
        }
        
        if (!password.isValidLength(leftBound: 6, rigthBound: 20)) {
            return (false, "Пароль должен содержать не менее 6 и не более 20 символов")
        }
        
        return (true, nil)
    }
    
}
