import Foundation

/// Протокол для хранимый объектов в кэше с инвалидацией по времени
protocol Expirable: AnyObject {
    var createdAt: Date { get }
}
