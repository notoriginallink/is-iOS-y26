/// Протокол хранилища пользовательских данных
protocol UserContextProtocol {
    /// Сохраняет данные пользователя
    /// - Parameter user: Модель пользователя
    func saveUser(_ user: User)
    
    /// Получает данные текущего авторизованного пользователя
    /// - Returns: Модель пользователя или nil, если пользователь не авторизован
    func getUser() -> User?
    
    /// Удаляет данные текущего пользователя
    func clearUser()
    
    /// Флаг, указывающий, авторизован ли пользователь
    var isLoggedIn: Bool { get }
}
