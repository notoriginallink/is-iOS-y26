import UIKit

class AppCoordinator: AppCoordinatorProtocol {
    
    // MARK: - Properties
    var childCoordinators: [any Coordinator] = []
    var navigationController: UINavigationController
    
    // MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Implementation
    func showAuth() {
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        authCoordinator.delegate = self
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }
    
    func showCocktailList() {
        // TODO: добавить список коктейлей
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
