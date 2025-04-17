import UIKit

class CocktailListViewController: UIViewController, CocktailListViewProtocol {
    
    // MARK: - Dependencies
    private var viewModel: CocktailListViewModelProtocol
    private let collectionManager: CollectionManager<CocktailCellView>
    private weak var coordinator: ListCoordinatorProtocol?
    
    // MARK: - Initializers
    init(viewModel: CocktailListViewModelProtocol, collectionManager: CollectionManager<CocktailCellView>, coordinator: ListCoordinatorProtocol? = nil) {
        self.viewModel = viewModel
        self.collectionManager = collectionManager
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
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
//        viewModel.reloadCocktails()
    }
    
    // MARK: - Bindings
    private func setupBindings() {
        guard let view = view as? CocktailListView else {
            fatalError("ListController view is not of type CocktailListView")
        }
        
        collectionManager.delegate = self
        collectionManager.attach(to: view.collectionView)
        view.onRefresh = { [weak self] in
            self?.viewModel.reloadCocktails()
        }
        
        view.onError = {[weak self] alert in
            self?.present(alert, animated: true)
        }
        
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
        collectionManager.updateItems(viewModel.cocktails)
    }
    
    func setLoading(_ isLoading: Bool) {
        DispatchQueue.main.async {
            guard let view = self.view as? CocktailListView else {
                return
            }
            if !isLoading {
                view.endRefreshing()
            }
        }
    }

    func showError(_ message: String) {
        DispatchQueue.main.async {
            guard let view = self.view as? CocktailListView else {
                return
            }
            
            view.setupError(message: message)
        }
    }
    
    func cocktailCardTapped(cocktailId: Int) {
        print("[DEBUG | ListController]: did select card ID=\(cocktailId)")
        coordinator?.showCard(with: cocktailId)
    }
}

extension CocktailListViewController: CollectionManagerDelegate {
    func didSelectItem(with id: Int) {
        cocktailCardTapped(cocktailId: id)
    }
    
    func didScrollToBottom() {
        viewModel.loadCocktails()
    }
}
