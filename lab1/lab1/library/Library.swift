import Foundation

public protocol Library {
    func addBook(_ book: LibraryItem)
    func removeBook(_ id: UUID)
    func getAllBooks() -> [LibraryItem]
    func findBooksByCriteria(criteria: Criteria) -> [LibraryItem]
}
