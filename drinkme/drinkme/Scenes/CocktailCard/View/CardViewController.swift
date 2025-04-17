import UIKit

class CardViewController: UIViewController {
    
    // MARK: - Properties
    private var viewModel: any CocktailCardViewModelProtocol
    private var id: Int
    
    // MARK: - Init
    init(viewModel: any CocktailCardViewModelProtocol, cocktailId: Int) {
        self.viewModel = viewModel
        self.id = cocktailId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = CardView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        viewModel.loadCocktail(id: id)
    }
    
    // MARK: - Bindings
    func setupBindings() {
        guard let view = view as? CardView else {
            fatalError("CardController view is not of type CardView")
        }
        
        viewModel.onStateChanged = { [weak self] in
            DispatchQueue.main.async {
                view.configure(with: self?.viewModel as! CardView.ViewModel)
            }
        }
    }
}
