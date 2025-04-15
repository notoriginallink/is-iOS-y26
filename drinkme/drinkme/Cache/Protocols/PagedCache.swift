import Foundation

/// Кэш с использованием пагинации
protocol PagedCache<T> {
    /// Хранимый тип
    associatedtype T
    
    /// Сохранить новые объекты в кэше
    /// - Parameter items: Массив объектов для сохранения
    /// - Parameter page: Номер страницы
    /// - Parameter pageSize: Размер страницы
    func put(items: [T], page: Int, pageSize: Int)
    
    /// Достать значения из кэша
    /// - Parameter page: Номер страницы
    /// - Parameter pageSize: Размер страницы
    /// - Returns: Список объектов для текущей страницы, либо `nil`, если кэш пуст
    func get(page: Int, pageSize: Int) -> [T]?
}
