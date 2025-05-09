public class GenreCriteria: Criteria {
    
    private let genre: Genre
    
    init(_ genre: Genre) {
        self.genre = genre
    }
    
    public func matches(_ item: any LibraryItem) -> Bool {
        return item.genre == genre
    }
    
    public func getDescription() -> String {
        return "Genre: \(genre.rawValue)"
    }
}
