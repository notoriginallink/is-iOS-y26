class CocktailListViewModel: CocktailListViewModelProtocol {
    
    // MARK: - Properties
    var cocktails: [CocktailCellViewModel] = []
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
            switch (result) {
            case.success(let newCocktails):
                print("[DEBUG | ViewModel]: Got \(newCocktails.count) new cocktails in ViewModel: \(newCocktails.map({$0.name}))")
                let models = self?.mapToViewModel(entities: newCocktails)
                self?.cocktails.append(contentsOf: models!)
            case.failure(let error):
                self?.errorMessage = error.localizedDescription
            }
            self?.isLoading = false
        }
    }
    
    // TODO: Deprecated?
    func cocktailViewModel(at index: Int) -> any CocktailCellViewModelProtocol {
        let cocktail = cocktails[index]
        return CocktailCellViewModel(id: cocktail.id, name: cocktail.name, imageUrl: cocktail.imageUrl, difficulty: cocktail.difficulty)
    }
    
    private func mapToViewModel(entities: [Cocktail]) -> [CocktailCellViewModel] {
        var result: [CocktailCellViewModel] = []
        for model in entities {
            result.append(CocktailCellViewModel(id: model.id, name: model.name, imageUrl: model.imageUrl, difficulty: model.difficulty))
        }
        return result
    }
}
