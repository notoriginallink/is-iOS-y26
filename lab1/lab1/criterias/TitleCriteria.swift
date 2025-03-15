public class TitleCriteria: Criteria {
    
    private let title: String
    
    public init(_ title: String) {
        self.title = title.lowercased()
    }
    
    public func matches(_ item: any LibraryItem) -> Bool {
        return item.title.lowercased() == title
    }
    
    public func getDescription() -> String {
        return "Title: \(title)"
    }
}
