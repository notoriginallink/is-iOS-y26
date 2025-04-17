
import UIKit

class ListCoordinator: ListCoordinatorProtocol {
    
    // MARK: - Properties
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var cocktailService: CocktailServiceProtocol

    
    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.cocktailService = CocktailService(cache: CocktailCache(), networkHelper: NetworkHelper(session: URLSession(configuration: .default)))
    }

    // MARK: - Methods
    func start() {
        let viewModel = CocktailListViewModel(cocktailService: cocktailService)
        let manager = CollectionManager<CocktailCellView>()
        let cocktailListVC = CocktailListViewController(viewModel: viewModel, collectionManager: manager, coordinator: self);
        navigationController.setViewControllers([cocktailListVC], animated: true)
    }

    func showCard(with id: Int) {
        print("[DEBUG | ListCoordinator]: showCard ID=\(id)")
        let viewModel = CardViewModel(service: cocktailService)
        let cardVC = CardViewController(viewModel: viewModel, cocktailId: id)
        navigationController.pushViewController(cardVC, animated: true)
    }
}
