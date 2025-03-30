
/// Класс, инкапсулирующий в себе логику работы с сетью
protocol NetworkHelperProtocol {
    
    /// Отправляет `GET` запрос по указанному эндпоинту и декордирует результат
    /// - Parameter endpoint: Эндпоинт, на который отправить запрос (начинается с `/`)
    /// - Parameter completion: Обработчик результата запроса
    func getRequest<T: Codable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void);
}
