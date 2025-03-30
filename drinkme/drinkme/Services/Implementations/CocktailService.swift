import Foundation
import DotEnv

class CocktailService: CocktailServiceProtocol {
    
    // MARK: - Properties
    private let baseURL = "https://alfa-itmo.ru/server/v1/storage";
    private let credentials: String
    private let session: URLSession
    private let cache: any PagedCache<Cocktail>
    
    // MARK: - Initializers
    init(session: URLSession = .shared, cache: any PagedCache<Cocktail>) {
        self.session = session
        self.cache = cache
        
        let env = DotEnv(withFile: ".env")
        guard let username = env.get("API_USERNAME"), let password = env.get("API_PASSWORD") else {
            fatalError("Could not read API credentials from .env")
        }
        credentials = "\(username):\(password)"
    }
    
    // MARK: - Methods
    func fetchCocktails(page: Int = 1, pageSize: Int = 10, completion: @escaping (Result<[Cocktail], any Error>) -> Void) {
        if let cachedCocktails = cache.get(page: page, pageSize: pageSize) {
            completion(.success(cachedCocktails))
            return
        }
        
        guard let url = URL(string: "\(baseURL)/cocktails?page=\(page)&pageSize=\(pageSize)") else {
            completion(.failure(CocktailServiceError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        guard let credentialData = credentials.data(using: .utf8) else { return }
        request.setValue("Basic \(credentialData.base64EncodedString())", forHTTPHeaderField: "Authorization")
        
        let task = session.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                completion(.failure(CocktailServiceError.networkError(error.localizedDescription)))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(CocktailServiceError.networkError("Invalid response")))
                return
            }
            
            switch response.statusCode {
            case 200:
                guard let data = data else {
                    completion(.failure(CocktailServiceError.networkError("No data")))
                    return
                }
                
                do {
                    let cocktails = try JSONDecoder().decode([Cocktail].self, from: data)
                    self?.cache.put(items: cocktails, page: page, pageSize: pageSize)
                    completion(.success(cocktails))
                    return
                } catch {
                    completion(.failure(CocktailServiceError.decodingError))
                }
            case 401:
                completion(.failure(CocktailServiceError.unauthorized))
            case 404:
                completion(.failure(CocktailServiceError.notFound))
            default:
                completion(.failure(CocktailServiceError.serverError(response.statusCode)))
            }
        }
    }
    
    func fetchCocktailDetails(id: String, completion: @escaping (Result<CocktailDetails, any Error>) -> Void) {
        // TODO: Логика аналогичная верхнему методу
    }
}
