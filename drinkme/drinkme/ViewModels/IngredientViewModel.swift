import UIKit

struct IngredientViewModel {
    var name: String;
    var amount: String;
    var unit: String;
    
    init(name: String, amount: String, unit: String) {
        self.name = name;
        self.amount = amount;
        self.unit = unit;
    }
}
