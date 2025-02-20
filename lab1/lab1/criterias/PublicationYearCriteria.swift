public class PublicationYearCriteria: Criteria {
    
    private let publicationYear: Int
    
    init(publicationYear: Int) {
        self.publicationYear = publicationYear
    }
    
    public func matches(item: any LibraryItem) -> Bool {
        return item.publicationYear == publicationYear
    }
    
    public func getDescription() -> String {
        return "Publication year: \(publicationYear)"
    }
}
