public class TitleCriteria: Criteria {
    
    private let title: String
    
    public init(title: String) {
        self.title = title.lowercased()
    }
    
    public func matches(item: any LibraryItem) -> Bool {
        return item.title.lowercased() == title
    }
    
    public func getDescription() -> String {
        return "Title: \(title)"
    }
}
