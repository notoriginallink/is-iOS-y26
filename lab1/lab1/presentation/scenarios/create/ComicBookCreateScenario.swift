public class ComicBookCreateScenario: BookCreateScenarioBase {
    private var issue: Int?
    
    override init(library: Library) {
        super.init(library: library)
        name = "Comic Book"
    }

    public override func reset() {
        super.reset()
        issue = nil
    }
    
    public override func buildBook() -> LibraryItem? {
        OutputDriver.printPrompt("Enter issue number:")
        while (issue == nil) {
            OutputDriver.printPrompt("Enter book publication year:")
            issue = Int(readLine() ?? "")
            if (issue == nil) {
                logError()
            }
        }
        
        return ComicBook(title: title!, author: author!, publicationYear: publicationYear!, genre: genre!, issue: issue!)
    }
}
