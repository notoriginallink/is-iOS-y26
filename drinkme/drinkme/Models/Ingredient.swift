import Foundation

struct Ingredient: Codable {
    let name: String;
    let amount: Int;
    let unit: MeasureUnit;
}
