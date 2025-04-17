import Foundation

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
        print("[INFO | CocktailService]: sending request to \(endpoint)")
        networkHelper.getRequest(endpoint: endpoint) { (result: Result<[Cocktail], Error>) in
            switch result {
            case .success(let cocktails):
                print("[INFO | CocktailService]: got \(cocktails.count) cocktails: \(cocktails.map({ $0.name }))")
                self.cache.put(items: cocktails, page: page, pageSize: pageSize)
                completion(.success(cocktails))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchCocktailDetails(id: Int, completion: @escaping (Result<CocktailDetails, any Error>) -> Void) {
        let endpoint = "/cocktailId=\(id)"
        print("[INFO | CocktailService]: sending request to \(endpoint)")
        networkHelper.getRequest(endpoint: endpoint) { (result: Result<CocktailDetails, Error>) in
            switch (result) {
            case.success(let cocktail):
                completion(.success(cocktail))
                return
            case.failure(let error):
                completion(.failure(error))
            }
        }
    }
}
