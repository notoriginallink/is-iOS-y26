import Foundation

enum CocktailServiceError: Error {
    case invalidURL
    case networkError(String)
    case decodingError
    case unauthorized
    case notFound
    case serverError(Int)
}
