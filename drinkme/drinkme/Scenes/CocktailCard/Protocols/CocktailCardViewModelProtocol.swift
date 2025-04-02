/// Протокол ViewModel для экрана деталей коктейля
protocol CocktailCardViewModelProtocol {
    /// Флаг, указывающий на процесс загрузки
    var isLoading: Bool { get }
    
    /// Сообщение об ошибке (если есть)
    var errorMessage: String? { get }
    
    /// Обработчик изменения состояния ViewModel
    var onStateChanged: (() -> Void)? { get set }
    
    /// Загружает детальную информацию о коктейле
    func loadCocktail()
    
    /// Название коктейля
    var name: String { get }
    
    /// Название картинки коктейля
    var imageName: String { get }
    
    /// Инструкция по приготовлению
    var recipe: [String] { get }
    
    /// Список ингредиентов
    var ingredients: [(name: String, measure: String)] { get }
    
    /// Список интсрументов для приготовления
    var gear: [String] { get }
}
