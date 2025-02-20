import Foundation

public class BookShelf: Library {
    private final var shelf: Dictionary<UUID, LibraryItem> = [:]
    
    public func addBook(_ book: any LibraryItem) {
        shelf[book.id] = book
    }
    
    public func removeBook(id: UUID) {
        shelf.removeValue(forKey: id)
    }
    
    public func getAllBooks() -> [any LibraryItem] {
        return shelf.values.map { $0 }
    }
    
    public func findBooksByCriteria(_ criteria: Criteria) -> [any LibraryItem] {
        return shelf.values.filter({criteria.matches($0)})
    }
}
