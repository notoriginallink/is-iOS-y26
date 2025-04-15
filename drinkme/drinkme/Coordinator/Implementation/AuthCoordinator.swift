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
        let networkHelper = NetworkHelper(session: URLSession(configuration: .default))
        let contextValidator = DefaultAuthContextValidator()
        let authService = AuthService(userContext: userContext, networkHelper: networkHelper)
        let viewModel = AuthViewModel(authService: authService, contextValidator: contextValidator)
        let authViewController = AuthViewController(viewModel: viewModel, coordinator: self)
        navigationController.pushViewController(authViewController, animated: true)
    }
    
    func authenticationDidComplete() {
        delegate?.completed(self)
    }
}
