import Foundation
import DotEnv

class CocktailService: CocktailServiceProtocol {
    
    // MARK: - Properties
    private let cache: any PagedCache<Cocktail>
    
    // MARK: - Dependencies
    private let networkHelper: NetworkHelperProtocol
    
    // MARK: - Initializers
    init(cache: any PagedCache<Cocktail>, networkHelper: NetworkHelperProtocol) {
        self.cache = cache
        self.networkHelper = networkHelper
    }
    
    // MARK: - Methods
    func fetchCocktails(page: Int = 1, pageSize: Int = 10, completion: @escaping (Result<[Cocktail], any Error>) -> Void) {
        if let cachedCocktails = cache.get(page: page, pageSize: pageSize) {
            completion(.success(cachedCocktails))
            return
        }
        
        let endpoint = "/cocktails-page=\(page),pageSize=\(pageSize)"
        networkHelper.getRequest(endpoint: endpoint, completion: { (result: Result<[Cocktail], Error>) in
            switch result {
            case .success(let cocktails):
                self.cache.put(items: cocktails, page: page, pageSize: pageSize)
                completion(.success(cocktails))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    func fetchCocktailDetails(id: String, completion: @escaping (Result<CocktailDetails, any Error>) -> Void) {
        // TODO: Логика аналогичная верхнему методу
    }
}
