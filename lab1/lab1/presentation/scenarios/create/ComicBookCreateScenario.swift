public class ComicBookCreateScenario: BookCreateScenarioBase {
    private var issue: Int?
    
    private let lib: Library
    
    init(library: Library) {
        lib = library
        super.init()
        name = "Comic Book"
    }
    
    public override func run() -> Bool {
        buildBasic()
        
        while (issue == nil) {
            print("Enter issue number: ", terminator: "")
            issue = Int(readLine() ?? "")
            if (issue == nil) {
                logError()
            }
        }
        
        guard (title != nil) && (author != nil) && (genre != nil) && (publicationYear != nil) && (issue != nil) else {
            return false
        }
        
        let book = ComicBook(title: title!, author: author!, publicationYear: publicationYear!, genre: genre!, issue: issue!)
        
        lib.addBook(book)
        
        print("✅ Book added successfully!")
        
        return true
    }
}
