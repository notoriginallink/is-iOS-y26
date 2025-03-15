public class GetAllScenario: Scenario{
    public private(set) var name: String = "Get all books"
    
    private var lib: Library
    
    init(library: Library) {
        lib = library
    }
    
    public func run() -> Bool {
        let books = lib.getAllBooks()
        OutputDriver.printFoundBooks(books)
        
        return true
    }
}
