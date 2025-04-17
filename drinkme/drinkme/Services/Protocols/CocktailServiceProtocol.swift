import Foundation

/// Протокол сервиса для взаимодействия с API коктейлей
protocol CocktailServiceProtocol {
    
    /// Получает список коктейлей
    /// - Parameter page: Номер страницы
    /// - Parameter pageSize: Размер страницы
    /// - Parameter completion: Обработчик завершения с результатом получения списка коктейлей
    func fetchCocktails(page: Int, pageSize: Int, completion: @escaping (Result<[Cocktail], Error>) -> Void)
    
    /// Получает информацию о коктейле
    /// - Parameters:
    ///   - id: Идентификатор коктейля
    ///   - completion: Обработчик завершения с результатом получения информации о коктейле
    func fetchCocktailDetails(id: Int, completion: @escaping (Result<CocktailDetails, Error>) -> Void)
}
