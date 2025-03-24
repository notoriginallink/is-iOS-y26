import Foundation

struct Ingredient {
    let name: String;
    let imageName: String; // TODO: потом заменить на url?
    let amount: Int;
    let unit: MeasureUnit;
    
    init(_ name: String, _ imageName: String, _ amount: Int, _ unit: MeasureUnit) {
        self.name = name;
        self.imageName = imageName;
        self.amount = amount;
        self.unit = unit;
    }
}
