import Foundation

/// Подробная информация о коктейле
struct CocktailDetails: Codable {
    let id: Int
    let name: String
    let imageUrl: String
    let description: String
    let ingredients: [Ingredient]
    let gear: [GearItem]
    let steps: [String]
}
