struct CocktailCellViewModel: CocktailCellViewModelProtocol {
    
    // MARK: - Properties
    var id: Int
    var name: String
    var imageUrl: String
    var difficulty: DifficultyLevel
    
    // MARK: - Initializers
    init(id: Int, name: String, imageUrl: String, difficulty: DifficultyLevel) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.difficulty = difficulty
    }
}
