/// Протокол ViewModel для экрана авторизации
protocol AuthViewModelProtocol {
    
    /// Контекст авторизации
    var authContext: AuthContext { get set }
    
    /// Происходит ли сейчас процесс авторизации
    var isLoading: Bool { get }
    
    /// Сообщение об ошибке (если есть ошибка)
    var errorMessage: String? { get }
    
    /// Обработчик изменения состояния ( при вооде данных )
    var onStateChanged: (() -> Void)? { get set }
    
    /// Обработчик изменения состояния при удачно попытке входа
    var onLoginSuccess: (() -> Void)? { get set }
    
    /// Функция для попытки входа
    func login()
}
