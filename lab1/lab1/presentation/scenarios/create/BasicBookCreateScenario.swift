public class BasicBookCreateScenario: BookCreateScenarioBase {
    private let lib: Library
    
    init(library: Library) {
        lib = library
        super.init()
        name = "Basic book"
    }
    
    public override func run() -> Bool {
        buildBasic()
        
        guard (title != nil) && (author != nil) && (genre != nil) && (publicationYear != nil) else {
            return false
        }
        
        let book = BasicBook(title: title!, author: author!, publicationYear: publicationYear!, genre: genre!)
        
        lib.addBook(book)
        
        print("✅ Book added successfully!")
        
        reset()
        
        return true
    }
    
    public override func reset() {
        super.reset()
    }
}
