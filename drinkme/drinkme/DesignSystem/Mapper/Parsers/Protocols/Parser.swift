import UIKit

extension DS {
    /// Протокол для парсинга комопнентов конкретного типа во View
    protocol Parser {
        /// Проверяет, может ли моделька быть обработана
        func conforms(model: Model) -> Bool
        
        /// Пытается создать UIView по переданной модели
        func tryParse(from model: Model) throws -> UIView
    }
}
