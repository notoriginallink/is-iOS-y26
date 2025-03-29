/// Сервис для процесса аутентификации

    /// Запуск процесса аутентификации
    /// - Parameter username имя пользователя
    /// - Parameter password пароль
    /// - Parameter completion действия, которые выполняться после попытки входа
    func login(username: String, password: String, completion: @escaping (Bool) -> Void)
}
