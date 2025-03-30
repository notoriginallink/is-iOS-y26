class UserContext: UserContextProtocol {
    
    // MARK: - Properties
    var isLoggedIn = false
    
    private var user: User? = nil
    
    
    // MARK: - Methods
    func saveUser(_ user: User) {
        self.user = user
        isLoggedIn = true
    }
    
    func getUser() -> User? {
        return user
    }
    
    func clearUser() {
        user = nil
        isLoggedIn = false
    }
}
