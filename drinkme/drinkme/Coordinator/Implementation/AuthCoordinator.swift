import UIKit

class AuthCoordinator: AuthCoordinatorProtocol {

    // MARK: - Properties
    var childCoordinators: [any Coordinator] = []
    var navigationController: UINavigationController
    weak var delegate: AuthCoordinatorDelegate?
    
    // MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Implementation
    func start() {
        let userContext = UserContext()
        let authService = AuthService(userContext: userContext)
        let contextValidator = DefaultAuthContextValidator()
        let viewModel = AuthViewModel(authService: authService, contextValidator: contextValidator)
        let authViewController = AuthViewController(viewModel: viewModel, coordinator: self)
        navigationController.pushViewController(authViewController, animated: true)
    }
    
    func authenticationDidComplete() {
        delegate?.completed(self)
    }
}
