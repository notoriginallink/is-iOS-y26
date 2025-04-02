import Foundation

/// Легковестная модель коктейля, только базовые параметры
struct Cocktail {
    let id: Int
    let name: String
    let imageUrl: String
    let difficulty: DifficultyLevel
}
