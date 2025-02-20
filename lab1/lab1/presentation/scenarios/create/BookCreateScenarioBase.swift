public class BookCreateScenarioBase: Scenario {
    public var name: String = ""
    
    private let lib: Library
    
    var title: String? = nil
    var author: String? = nil
    var genre: Genre? = nil
    var publicationYear: Int? = nil
    
    init(library: Library) {
        lib = library
    }
    
    public func run() -> Bool {
        guard buildBase() != false else {
            return false
        }
        
        guard let book = buildBook() else {
            OutputDriver.printError("Error while creating a book!")
            return false
        }
        
        lib.addBook(book)
        
        OutputDriver.printSuccess("Book added successfully!")
        
        reset()
        
        return true
    }
    
    func buildBase() -> Bool {
        while (title == nil) {
            OutputDriver.printPrompt("Enter book name:")
            title = readLine()
            if (title == nil) {
                logError()
            }
        }
        
        while (author == nil) {
            OutputDriver.printPrompt("Enter book author:")
            author = readLine()
            if (author == nil) {
                logError()
            }
        }
        
        while (publicationYear == nil) {
            OutputDriver.printPrompt("Enter book publication year:")
            publicationYear = Int(readLine() ?? "")
            if (publicationYear == nil) {
                logError()
            }
        }
        
        while (genre == nil) {
            OutputDriver.printPrompt("Enter book genre (\(Genre.allCases.map({$0.rawValue})):")
            genre = Genre(rawValue: readLine() ?? "")
            if (genre == nil) {
                logError()
            }
        }
        
        guard (title != nil) && (author != nil) && (genre != nil) && (publicationYear != nil) else {
            return false
        }
        
        return true
    }
    
    public func buildBook() -> LibraryItem? {
        fatalError("Subclasses must override buildBook()")
    }
    
    public func reset() {
        title = nil
        author = nil
        genre = nil
        publicationYear = nil
    }
    
    func logError() {
        OutputDriver.printError("Invalid parameters. Please try again")
    }
}
