import UIKit

class AuthService: AuthServiceProtocol {
    
    // MARK: - Dependencies
    private let userContext: UserContextProtocol
    private let networkHelper: NetworkHelperProtocol
    
    // MARK: - Initializers
    init(userContext: UserContextProtocol, networkHelper: NetworkHelperProtocol) {
        self.userContext = userContext
        self.networkHelper = networkHelper
    }
    
    // MARK: - Methods
    func login(username: String, password: String, completion: @escaping (Result<Void, any Error>) -> Void) {
        let endpoint = "/users-\(username)"
        print("[DEBUG]: Send request to endpoint: \(endpoint)")
        networkHelper.getRequest(endpoint: endpoint, completion: { (result: Result<User, Error>) in
            DispatchQueue.main.async {
                switch result {
                case.success(let user):
                    print("[DEBUG]: User was found? \(user.username):\(user.password)")
                    let credentialsValid = (username == user.username && password == user.password)
                    if (credentialsValid) {
                        self.userContext.saveUser(user)
                        completion(.success(()))
                    } else {
                        completion(.failure(AuthError.wrongPassword))
                    }
                case.failure(let error):
                    print("[DEBUG]: login error -- \(error)")
                    completion(.failure(AuthError.unknownUser))
                }
            }
        })
    }
}
