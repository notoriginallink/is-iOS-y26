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
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }
    
    func showCocktailList() {
        // TODO: добавить список коктейлей
    }
    
    func logout() {
        navigationController.popToRootViewController(animated: true)
    }
        
    func start() {
        showAuth()
    }
}
