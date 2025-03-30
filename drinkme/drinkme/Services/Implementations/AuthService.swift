import UIKit

class AuthService: AuthServiceProtocol {
    
    private let userContext: UserContextProtocol
    
    init(userContext: UserContextProtocol) {
        self.userContext = userContext
    }
    
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        // TODO: Тут надо будет доставать юзера из репозитория
        let user = User(id: 1, username: "danya", password: "qwerty", favoriteCocktails: [])
        
        let result = (user != nil && username == user.username && password == user.password)
        if (result) {
            userContext.saveUser(user)
        }
        
        completion(result)
    }
}
