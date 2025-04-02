/// Протокол для View экрана деталей коктейля
protocol CocktailCardViewProtocol: AnyObject {
    /// Обновляет информацию о коктейле
    func updateCocktailInfo()
    
    /// Устанавливает состояние загрузки
    /// - Parameter isLoading: true, если происходит загрузка
    func setLoading(_ isLoading: Bool)
    
    /// Отображает сообщение об ошибке
    /// - Parameter message: Текст сообщения
    func showError(_ message: String?)
}
