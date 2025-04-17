import UIKit

class AppCoordinator: AppCoordinatorProtocol {
    
    // MARK: - Properties
    var childCoordinators: [any Coordinator] = []
    var navigationController: UINavigationController
    var userContext: UserContextProtocol
    
    // MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.userContext = UserContext()
    }
    
    // MARK: - Implementation
    func showAuth() {
        let authCoordinator = AuthCoordinator(navigationController: navigationController, userContext: userContext)
        authCoordinator.delegate = self
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }
    
    func showCocktailList() {
        let listCoordinator = ListCoordinator(navigationController: navigationController)
        childCoordinators.append(listCoordinator)
        listCoordinator.start()
    }
    
    func logout() {
        // TODO: добавить экран выхода
    }
        
    func start() {
        showAuth()
    }
}

extension AppCoordinator: AuthCoordinatorDelegate {
    func completed(_ coordinator: AuthCoordinatorProtocol) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
        showCocktailList()
    }
}
