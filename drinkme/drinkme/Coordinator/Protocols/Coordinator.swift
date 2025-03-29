import UIKit

/// Базовый протокол координатора
protocol Coordinator: AnyObject {
    /// Дочерние координаторы
    var childCoordinators: [Coordinator] { get set }
    
    /// Навигационный контроллер для управления экранами
    var navigationController: UINavigationController { get set }
    
    /// Запускает координатор
    func start()
}
