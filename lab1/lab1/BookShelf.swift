import Foundation

public class BookShelf: Library {
    private final var shelf: Dictionary<UUID, LibraryItem> = [:]
    
    public func addBook(_ book: any LibraryItem) {
        shelf[book.id] = book
    }
    
    public func removeBook(_ id: UUID) {
        shelf.removeValue(forKey: id)
    }
    
    public func getAllBooks() -> [any LibraryItem] {
        return shelf.values.map { $0 }
    }
    
    public func findBooksByCriteria(criteria: Criteria) -> [any LibraryItem] {
        return shelf.values.filter(criteria.matches(item:))
    }
}
