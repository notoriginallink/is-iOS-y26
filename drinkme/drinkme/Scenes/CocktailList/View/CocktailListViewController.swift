import UIKit

class CocktailListViewController: UIViewController, CocktailListViewProtocol {
    
    // MARK: - Dependencies
    private var viewModel: CocktailListViewModelProtocol
    private let collectionManager: CollectionManagerProtocol
    private weak var coordinator: ListCoordinatorProtocol?
    
    // MARK: - Initializers
    init(viewModel: CocktailListViewModelProtocol, collectionManager: CollectionManagerProtocol, coordinator: ListCoordinatorProtocol? = nil) {
        self.viewModel = viewModel
        self.collectionManager = collectionManager
        self.coordinator = coordinator
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = CocktailListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    // MARK: - Bindings
    private func setupBindings() {
        viewModel.onStateChanged = { [weak self] in
            guard let self = self else { return }
            
            if self.viewModel.isLoading {
                self.setLoading(true)
            } else {
                self.setLoading(false)
                
                if let errorMessage = self.viewModel.errorMessage {
                    self.showError(errorMessage)
                } else {
                    self.reloadCocktails()
                }
            }
        }
    }
    
    // MARK: - Methods
    func reloadCocktails() {
//        let viewModels = viewModel.getCocktailCellViewModels()
//        tableManager.updateData(with: viewModels)
    }
    
    func setLoading(_ isLoading: Bool) {
        // TODO: Включать/выключать activity indicator
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func cocktailCardTapped(cocktailId: String) {
        coordinator?.showCard(with: cocktailId)
    }
}
