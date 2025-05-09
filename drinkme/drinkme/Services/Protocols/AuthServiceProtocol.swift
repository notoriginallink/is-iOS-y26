/// Сервис для процесса аутентификации
protocol AuthServiceProtocol {
    /// Запуск процесса аутентификации
    /// - Parameter username имя пользователя
    /// - Parameter password пароль
    /// - Parameter completion действия, которые выполняться после попытки входа
    func login(username: String, password: String, completion: @escaping (Result<Void, any Error>) -> Void)
}
