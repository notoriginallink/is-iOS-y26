import Foundation

/// Протокол сервиса для взаимодействия с API коктейлей
protocol CocktailServiceProtocol {
    
    /// Получает список коктейлей
    /// - Parameter completion: Обработчик завершения с результатом получения списка коктейлей
    func fetchCocktails(completion: @escaping (Result<[Cocktail], Error>) -> Void)
    
    /// Получает информацию о коктейле
    /// - Parameters:
    ///   - id: Идентификатор коктейля
    ///   - completion: Обработчик завершения с результатом получения информации о коктейле
    func fetchCocktailDetails(id: String, completion: @escaping (Result<CocktailDetails, Error>) -> Void)
}
