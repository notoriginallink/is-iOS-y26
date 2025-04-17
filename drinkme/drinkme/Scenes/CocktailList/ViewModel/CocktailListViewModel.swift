class CocktailListViewModel: CocktailListViewModelProtocol {
    
    // MARK: - Properties
    var cocktails: [CocktailCellViewModel] = []
    var page: Int = 1
    var pageSize: Int = 10
    var lastPage: Int = -1
    
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
        // TODO: Убрать этот костыль, когда (если) научимся передавать последнюю страницу с сервера
        if (lastPage != -1 && page == lastPage) {
            return
        }
        
        isLoading = true
        cocktailsService.fetchCocktails(page: page, pageSize: pageSize) { [weak self] result in
            guard let self = self else {
                self?.isLoading = false
                return
            }
            
            switch (result) {
            case.success(let newCocktails):
                print("[DEBUG | ViewModel]: Got \(newCocktails.count) new cocktails in ViewModel: \(newCocktails.map({$0.name}))")
                let models = self.mapToViewModel(entities: newCocktails)
                self.cocktails.append(contentsOf: models)
                
                // TODO: Тут вообще по хорошему надо доработать пагинацию, чтобы возвращался номер последней страницы, тогда убрать этот костыль
                if (newCocktails.count > 0) {
                    self.page += 1
                } else {
                    self.lastPage = self.page
                }
                self.isLoading = false
                return
            case.failure(let error):
                self.isLoading = false
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func reloadCocktails() {
        page = 1
        isLoading = true
        cocktailsService.fetchCocktails(page: page, pageSize: pageSize) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let newCocktails):
                print("[DEBUG | ViewModel]: Reloaded cocktails: \(newCocktails.map { $0.name })")
                let models = self.mapToViewModel(entities: newCocktails)
                self.cocktails = models
                self.isLoading = false
                return
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
        page += 1
    }
    
    private func mapToViewModel(entities: [Cocktail]) -> [CocktailCellViewModel] {
        var result: [CocktailCellViewModel] = []
        for model in entities {
            result.append(CocktailCellViewModel(id: model.id, name: model.name, imageUrl: model.imageUrl, difficulty: model.difficulty))
        }
        return result
    }
}
