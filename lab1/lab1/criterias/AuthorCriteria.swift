public class AuthorCriteria: Criteria {
    
    private let author: String
    
    init(_ author: String) {
        self.author = author.lowercased()
    }
    
    public func matches(_ item: any LibraryItem) -> Bool {
        return item.author == author.lowercased()
    }
    
    public func getDescription() -> String {
        return "Author: \(author)"
    }
}

