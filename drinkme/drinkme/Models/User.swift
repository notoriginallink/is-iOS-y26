import Foundation

/// Модель пользователя
struct User: Codable {
    let username: String
    let password: String
    let favoriteCocktails: [Int]
    let role: UserRole
}
