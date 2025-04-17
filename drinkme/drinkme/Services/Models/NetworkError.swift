import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case networkError(String)
    case decodingError
    case unauthorized
    case notFound
    case serverError(Int)
    case imageDecodingError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL, .decodingError, .unauthorized, .notFound, .imageDecodingError:
            return "Ошибка сервера"
        case .networkError(let msg):
            return msg
        case .serverError(let code):
            return "Ошибка сервера: \(code)"
        }
    }
}
