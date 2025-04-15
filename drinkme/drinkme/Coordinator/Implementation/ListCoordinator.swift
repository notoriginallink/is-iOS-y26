
import UIKit

class ListCoordinator: ListCoordinatorProtocol {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let cache = CocktailCache()
        let helper = NetworkHelper(session: URLSession(configuration: .default))
        let cocktailService = CocktailService(cache: cache, networkHelper: helper)
        let viewModel = CocktailListViewModel(cocktailService: cocktailService)
        let manager = CollectionManager<CocktailCellView>()
        let cocktailListVC = CocktailListViewController(viewModel: viewModel, collectionManager: manager);
        navigationController.setViewControllers([cocktailListVC], animated: true)
    }

    func showCard(with id: Int) {
        // TODO: создать контроллер для карточки и пушить его тут
    }
}
