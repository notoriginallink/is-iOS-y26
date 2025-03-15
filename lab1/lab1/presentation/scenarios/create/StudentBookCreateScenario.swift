public class StudentBookCreateScenario: BookCreateScenarioBase {
    
    private var year: Int?
    
    override init(library: Library) {
        super.init(library: library)
        name = "Student Book"
    }
    
    public override func reset() {
        super.reset()
        year = nil
    }
    
    public override func buildBook() -> LibraryItem? {
        OutputDriver.printPrompt("Enter year:")
        while (year == nil) {
            OutputDriver.printPrompt("Enter book publication year:")
            year = Int(readLine() ?? "")
            if (year == nil) {
                logError()
            }
        }
        
        return StudentBook(title: title!, author: author!, publicationYear: publicationYear!, genre: genre!, year: year!)
    }
}
