/// Протокол ViewModel для ячейки коктейля
protocol CocktailCellViewModelProtocol {
    
    /// ID коктейля
    var id: Int { get }
    
    /// Название коктейля
    var name: String { get }
    
    /// Название картинки коктейля
    var imageUrl: String { get }
    
    /// Сложность приготовления
    var difficulty: DifficultyLevel { get }
}
