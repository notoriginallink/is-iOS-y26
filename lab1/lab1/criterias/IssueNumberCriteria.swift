public class IssueNumberCriteria: Criteria {
    private let issue: Int
    
    init(issue: Int) {
        self.issue = issue
    }
    
    public func matches(item: any LibraryItem) -> Bool {
        guard let comicBook = item as? ComicBook else {
            return false
        }
        
        return comicBook.issue == issue
    }
    
    public func getDescription() -> String {
        return "Issue: \(issue)"
    }
}
