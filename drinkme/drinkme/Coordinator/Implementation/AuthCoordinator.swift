import UIKit

class AuthCoordinator: AuthCoordinatorProtocol {
    
    // MARK: - Properties
    var childCoordinators: [any Coordinator] = []
    var navigationController: UINavigationController
    
    // MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Implementation
    func goToCocktailList() {
        print("[DEBUG]: Go to cocktail list awoke") // TODO: добавить переход в список коктейлей
    }
    
    func start() {
        let userContext = UserContext()
        let authService = AuthService(userContext: userContext)
        let viewModel = AuthViewModel(authService: authService)
        let authViewController = AuthViewController(viewModel: viewModel, coordinator: self)
        navigationController.pushViewController(authViewController, animated: true)
    }
}
