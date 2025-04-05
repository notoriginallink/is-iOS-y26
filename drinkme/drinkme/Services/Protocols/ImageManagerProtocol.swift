import UIKit

/// Протокол для получения изображений
protocol ImageManagerProtocol {
    
    /// Получить изображение по его URL-адресу
    /// - Parameter url: `URL` адрес изображения
    /// - Parameter completion: Обработчик результата поиска
    func getImage(url: String, completion: @escaping (UIImage?) -> Void)
}
