import Foundation

struct Cocktail {
    let name: String
    let description: String
    let imageName: String? // TODO: заменить на URL потом?
    let ingredients: [Ingredient]
    let gear: [GearItem]
    let steps: [String]
    let difficulty: [DifficultyLevel]
}
