/// Протокол ViewModel для ячейки коктейля
protocol CocktailCellViewModelProtocol {
    
    /// Название коктейля
    var name: String { get }
    
    /// Название картинки коктейля
    var imageUrl: String { get }
}
