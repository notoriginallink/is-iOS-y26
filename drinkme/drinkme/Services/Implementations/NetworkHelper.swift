import Foundation
import UIKit

class NetworkHelper: NetworkHelperProtocol {
    
    // MARK: - Properties
    private let baseURL = "https://alfa-itmo.ru/server/v1/storage"
    private let credentials: String
    private let session: URLSession
    
    // MARK: - Initializers
    init(session: URLSession) {
        self.session = session
        
        guard let username = Bundle.main.object(forInfoDictionaryKey: "API_USERNAME") as? String,
                let password = Bundle.main.object(forInfoDictionaryKey: "API_PASSWORD") as? String else {
            fatalError("Could not read API credentials from Info.plist")
        }
        credentials = "\(username):\(password)"
        print(credentials)
    }
    
    // MARK: - Methods
    func getRequest<T>(
        endpoint: String,
        completion: @escaping (Result<T, any Error>) -> Void
    ) where T : Decodable {
        guard let url = URL(string: baseURL + endpoint) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        guard let credentialData = credentials.data(using: .utf8) else { return }
        request.setValue("Basic \(credentialData.base64EncodedString())", forHTTPHeaderField: "Authorization")
        
        let task = session.dataTask(with: request) {  data, response, error in
            if let error = error {
                completion(.failure(NetworkError.networkError(error.localizedDescription)))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.networkError("Invalid response")))
                return
            }
            
            switch response.statusCode {
            case 200:
                guard let data = data else {
                    completion(.failure(NetworkError.networkError("No data")))
                    return
                }
                
                do {
                    let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedResponse))
                    return
                } catch DecodingError.typeMismatch(let type, let context) {
                    print("[ERROR]: Тип данных не соответствует: \(type) в \(context)")
                    completion(.failure(NetworkError.decodingError))
                  } catch DecodingError.valueNotFound(let type, let context) {
                    print("[ERROR]: Значение не найдено: \(type) в \(context)")
                    completion(.failure(NetworkError.decodingError))
                  } catch DecodingError.keyNotFound(let key, let context) {
                    print("[ERROR]: Ключ не найден: \(key) в \(context)")
                    completion(.failure(NetworkError.decodingError))
                  } catch DecodingError.dataCorrupted(let context) {
                    print("[ERROR]: Данные повреждены: \(context)")
                    completion(.failure(NetworkError.decodingError))
                  } catch {
                    completion(.failure(NetworkError.decodingError))
                  }
            case 401:
                completion(.failure(NetworkError.unauthorized))
            case 404:
                completion(.failure(NetworkError.notFound))
            default:
                completion(.failure(NetworkError.serverError(response.statusCode)))
            }
        }
        
        task.resume()
    }
    
    func downloadImage(url: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(NetworkError.networkError(error.localizedDescription)))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.networkError("Invalid response")))
                return
            }
            
            guard response.statusCode == 200, let data = data else {
                completion(.failure(NetworkError.networkError("Invalid response")))
                return
            }
            
            if let image = UIImage(data: data) {
                completion(.success(image))
            } else {
                completion(.failure(NetworkError.imageDecodingError))
            }
        }
        
        task.resume()
    }
}
