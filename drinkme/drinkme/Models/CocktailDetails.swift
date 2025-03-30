import Foundation

/// Подробная информация о коктейле
struct CocktailDetails {
    let id: Int
    let description: String
    let ingredients: [Ingredient]
    let gear: [GearItem]
    let steps: [String]
}
