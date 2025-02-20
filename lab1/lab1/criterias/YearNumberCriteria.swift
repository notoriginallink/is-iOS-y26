public class YearNumberCriteria: Criteria {
    
    private let year: Int
    
    init(_ year: Int) {
        self.year = year
    }
    
    public func matches(_ item: any LibraryItem) -> Bool {
        guard let studentBook = item as? StudentBook else {
            return false
        }
        
        return studentBook.year == year
    }
    
    public func getDescription() -> String {
        return "Year: \(year)"
    }
}
