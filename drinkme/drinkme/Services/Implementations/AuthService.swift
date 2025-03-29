import UIKit

class AuthService: AuthServiceProtocol {
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        // TODO: Тут надо будет доставать из репозитория юзера и сравнивать пароли
        let result = (username == "danya" && password == "qwerty")
        completion(result)
    }
}
