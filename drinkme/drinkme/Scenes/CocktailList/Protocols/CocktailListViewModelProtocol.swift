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
    
    /// Загружает список коктейлей (С пагинацией)
    func loadCocktails()
    
    /// Перезагружает коктейли заново (Пагинация сбрасывается)
    func reloadCocktails()
}
