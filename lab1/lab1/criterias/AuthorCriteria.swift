public class AuthorCriteria: Criteria {
    
    private let author: String
    
    init(author: String) {
        self.author = author.lowercased()
    }
    
    public func matches(item: any LibraryItem) -> Bool {
        return item.author == author.lowercased()
    }
    
    public func getDescription() -> String {
        return "Author: \(author)"
    }
}

