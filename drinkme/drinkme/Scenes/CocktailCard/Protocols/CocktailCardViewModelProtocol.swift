/// Протокол ViewModel для экрана деталей коктейля
protocol CocktailCardViewModelProtocol: Identifiable where ID == Int {
    
    /// Информация о коктейле
    var cocktail: CocktailDetails? { get }
    
    /// Флаг, указывающий на процесс загрузки
    var isLoading: Bool { get }
    
    /// Сообщение об ошибке (если есть)
    var errorMessage: String? { get }
    
    /// Обработчик изменения состояния ViewModel
    var onStateChanged: (() -> Void)? { get set }
    
    /// Загружает детальную информацию о коктейле
    func loadCocktail(id: Int)
}
