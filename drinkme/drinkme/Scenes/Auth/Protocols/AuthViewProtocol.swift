/// Протокол для View экрана авторизации
protocol AuthViewProtocol: AnyObject {
    
    /// Устанавливает состояние загрузки
    /// - Parameter isLoading: true, если происходит загрузка
    func setLoading(_ isLoading: Bool)
    
    /// Действия при успешной авторизации
    func loginSuccessful()
}
