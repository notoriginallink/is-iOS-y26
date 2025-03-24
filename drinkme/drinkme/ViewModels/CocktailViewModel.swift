import UIKit

struct CocktailViewModel {
    var name: String;
    var description: String;
    var imageName: String;
    var ingredients: [IngredientViewModel];
    var tools: [String];
    
    init(
        name: String,
        description: String,
        imageName: String,
        ingredients: [IngredientViewModel],
        tools: [String]
    ) {
        self.name = name;
        self.description = description;
        self.imageName = imageName;
        self.ingredients = ingredients;
        self.tools = tools;
    }
    
    static func createExample() -> CocktailViewModel {
        return CocktailViewModel(
            name: "Белый русский",
            description: "Любимый напиток Джеффри Лебовски из фильма «Большой Лебовски»",
            imageName: "WhiteRussian",
            ingredients: [
                IngredientViewModel(name: "Водка", amount: "50", unit: "мл."),
                IngredientViewModel(name: "Кофейный ликер", amount: "50", unit: "мл."),
                IngredientViewModel(name: "Сливки", amount: "50", unit: "мл."),
                IngredientViewModel(name: "Лед в кубиках", amount: "100", unit: "г."),
            ],
            tools: [
                "Стакан Рокс",
                "Трубочка"
            ]
        )
    }
}
