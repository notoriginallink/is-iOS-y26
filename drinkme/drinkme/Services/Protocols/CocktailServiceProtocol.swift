/// Протокол сервиса для взаимодействия с API коктейлей
protocol CocktailServiceProtocol {
    /// Авторизует пользователя в системе
    /// - Parameters:
    ///   - username: Имя пользователя
    ///   - password: Пароль пользователя
    ///   - completion: Обработчик завершения с результатом авторизации
    func login(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    
    /// Получает список коктейлей
    /// - Parameter completion: Обработчик завершения с результатом получения списка коктейлей
    func fetchCocktails(completion: @escaping (Result<[Cocktail], Error>) -> Void)
    
    /// Получает информацию о коктейле
    /// - Parameters:
    ///   - id: Идентификатор коктейля
    ///   - completion: Обработчик завершения с результатом получения информации о коктейле
    func fetchCocktailDetails(id: String, completion: @escaping (Result<Cocktail, Error>) -> Void)
}
