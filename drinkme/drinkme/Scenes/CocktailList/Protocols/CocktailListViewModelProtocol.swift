/// Протокол ViewModel для экрана списка коктейлей
protocol CocktailListViewModelProtocol {
    
    /// Список коктейлей
    var cocktails: [CocktailCellViewModel] { get }
    
    /// Флаг, указывающий на процесс загрузки
    var isLoading: Bool { get }
    
    /// Сообщение об ошибке (если есть)
    var errorMessage: String? { get }
    
    /// Обработчик изменения состояния
    var onStateChanged: (() -> Void)? { get set }
    
    /// Загружает список коктейлей
    func loadCocktails()
    
    /// Возвращает ViewModel для ячейки коктейля
    /// - Parameter index: Индекс коктейля в списке
    /// - Returns: ViewModel для ячейки
    func cocktailViewModel(at index: Int) -> CocktailCellViewModelProtocol
}
