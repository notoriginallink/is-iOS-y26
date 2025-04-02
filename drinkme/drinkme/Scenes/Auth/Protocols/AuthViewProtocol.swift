/// Протокол для View экрана авторизации
protocol AuthViewProtocol: AnyObject {
    
    /// Устанавливает состояние загрузки
    /// - Parameter isLoading: true, если происходит загрузка
    func setLoading(_ isLoading: Bool)
    
    /// Отображает сообщение об ошибке
    /// - Parameter message: Текст ошибки
    func showError(message: String)
    
    /// Обновляет состояние кнопки авторизации (Делает активной/неактивной)
    /// - Parameter isEnabled: true, если кнопка должна быть активна
    func updateLoginButton(isEnabled: Bool)
    
    /// Действия при успешной авторизации
    func loginSuccessful()
}
