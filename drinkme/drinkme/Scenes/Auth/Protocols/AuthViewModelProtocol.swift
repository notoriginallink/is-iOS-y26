/// Протокол ViewModel для экрана авторизации
protocol AuthViewModelProtocol {
    
    /// Введенное имя пользователя
    var username: String { get set }
    
    /// Введенный пароль
    var password: String { get set }
    
    /// Происходит ли сейчас процесс аутентификации
    var isLoading: Bool { get }
    
    /// Сообщение об ошибке (если есть ошибка)
    var errorMessage: String? { get }
    
    /// Обработчик изменения состояния ( при вооде данных )
    var onStateChanged: (() -> Void)? { get set }
    
    /// Обработчик изменения состояния при удачно попытке входа
    var onLoginSuccess: (() -> Void)? { get set }
    
    /// Функция для попытки входа
    func login()
    
    /// Валидация введенных данных
    func validateInput() -> Bool
}
