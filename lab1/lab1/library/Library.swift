import Foundation

public protocol Library {
    func addBook(_ book: LibraryItem)
    func removeBook(id: UUID)
    func getAllBooks() -> [LibraryItem]
    func findBooksByCriteria(_ criteria: Criteria) -> [LibraryItem]
}
