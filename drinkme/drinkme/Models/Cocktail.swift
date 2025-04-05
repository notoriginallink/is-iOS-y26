import Foundation

/// Легковестная модель коктейля, только базовые параметры
struct Cocktail: Codable {
    let id: Int
    let name: String
    let imageUrl: String
    let difficulty: DifficultyLevel
}
