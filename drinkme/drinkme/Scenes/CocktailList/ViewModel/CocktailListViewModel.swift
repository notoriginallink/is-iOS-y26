class CocktailListViewModel: CocktailListViewModelProtocol {
    
    // MARK: - Properties
    var cocktails: [Cocktail] = []
    var page: Int = 1
    var pageSize: Int = 10
    
    private(set) var isLoading: Bool = false {
        didSet { onStateChanged?() }
    }
    
    private(set) var errorMessage: String? {
        didSet { onStateChanged?() }
    }
    
    var onStateChanged: (() -> Void)?
    
    // MARK: - Dependencies
    private let cocktailsService: CocktailServiceProtocol
    
    // MARK: - Initializers
    init(cocktailService: CocktailServiceProtocol) {
        self.cocktailsService = cocktailService
    }
    
    // MARK: - Methods
    func loadCocktails() {
        isLoading = true
        cocktailsService.fetchCocktails(page: page, pageSize: pageSize) { [weak self] result in
            self?.isLoading = false
            switch (result) {
            case.success(let newCocktails):
                self?.cocktails.append(contentsOf: newCocktails)
                self?.errorMessage = nil
                self?.page += 1
            case.failure(let error):
                self?.errorMessage = error.localizedDescription
            }
            self?.onStateChanged?()
        }
    }
    
    func cocktailViewModel(at index: Int) -> any CocktailCellViewModelProtocol {
        let cocktail = cocktails[index]
        return CocktailCellViewModel(name: cocktail.name, imageUrl: cocktail.imageUrl, difficulty: cocktail.difficulty)
    }
}
