class CocktailCellViewModel: CocktailCellViewModelProtocol {
    
    // MARK: - Properties
    var name: String
    var imageUrl: String
    var difficulty: DifficultyLevel
    
    // MARK: - Initializers
    init(name: String, imageUrl: String, difficulty: DifficultyLevel) {
        self.name = name
        self.imageUrl = imageUrl
        self.difficulty = difficulty
    }
}
