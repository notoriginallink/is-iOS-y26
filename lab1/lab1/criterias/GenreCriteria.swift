public class GenreCriteria: Criteria {
    
    private let genre: Genre
    
    init(genre: Genre) {
        self.genre = genre
    }
    
    public func matches(item: any LibraryItem) -> Bool {
        return item.genre == genre
    }
}
