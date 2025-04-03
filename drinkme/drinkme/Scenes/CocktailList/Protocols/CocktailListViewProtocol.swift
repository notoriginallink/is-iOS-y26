/// Протокол для View экрана списка коктейлей
protocol CocktailListViewProtocol: AnyObject {
    
    /// Обновляет список коктейлей
    func reloadCocktails()
    
    /// Устанавливает состояние загрузки
    /// - Parameter isLoading: true, если происходит загрузка
    func setLoading(_ isLoading: Bool)
    
    /// Отображает сообщение об ошибке
    /// - Parameter message: Текст сообщения
    func showError(_ message: String)
    
    /// Действия при нажании на карточку коктейля
    /// - Parameter cocktailId: id коктейля
    func cocktailCardTapped(cocktailId: String)
}
