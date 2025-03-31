class AuthViewModel: AuthViewModelProtocol {

    // MARK: - Properties
    var authContext: AuthContext = AuthContext()
    
    private(set) var isLoading: Bool = false {
        didSet { onStateChanged?() }
    }
    
    private(set) var errorMessage: String? {
        didSet { onStateChanged?() }
    }
    
    var onStateChanged: (() -> Void)?
    
    var onLoginSuccess: (() -> Void)?
    
    // MARK: - Dependencies
    private let authService: AuthServiceProtocol
    private let contextValidator: AuthContextValidator
    
    // MARK: - Initializer
    init(authService: AuthServiceProtocol, contextValidator: AuthContextValidator) {
        self.authService = authService
        self.contextValidator = contextValidator
    }
    
    // MARK: - Functions
    func login() {
        switch contextValidator.validate(authContext) {
        case.success():
            self.errorMessage = nil
            self.isLoading = true
            self.authService.login(username: self.authContext.username, password: self.authContext.password, completion: { [weak self] result in
                guard let self = self else { return }
                
                self.isLoading = false
                switch result {
                case.success():
                    self.onLoginSuccess?()
                    return
                case.failure(let error):
                    self.errorMessage = error.localizedDescription
                    return
                }
            })
        case.failure(let error):
            self.errorMessage = error.localizedDescription
        }
}
