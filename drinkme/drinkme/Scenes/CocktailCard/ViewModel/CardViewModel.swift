import Foundation

class CardViewModel: CocktailCardViewModelProtocol {

    // MARK: - Properties
    var cocktail: CocktailDetails?
    
    private(set) var isLoading: Bool = false {
        didSet { onStateChanged?() }
    }
    
    private(set) var errorMessage: String? {
        didSet { onStateChanged?() }
    }
    
    var id: Int {
        return cocktail?.id ?? -1
    }

    var onStateChanged: (() -> Void)?
    
    // MARK: - Dependencies
    private let service: CocktailServiceProtocol
    
    // MARK: - Init
    init(service: CocktailServiceProtocol) {
        self.service = service
    }
    
    // MARK: - Methods
    func loadCocktail(id: Int) {
        isLoading = true
        service.fetchCocktailDetails(id: id) { [weak self] result in
            switch (result) {
            case.success(let cocktail):
                self?.cocktail = cocktail
                self?.isLoading = false
                return
            case.failure(let error):
                self?.errorMessage = error.localizedDescription
                self?.isLoading = false
            }
        }
    }
}
