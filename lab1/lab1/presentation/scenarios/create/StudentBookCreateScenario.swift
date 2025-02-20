public class StudentBookCreateScenario: BookCreateScenarioBase {
    private var year: Int?
    
    private let lib: Library
    
    init(library: Library) {
        lib = library
        super.init()
        name = "Student Book"
    }
    
    public override func run() -> Bool {
        buildBasic()
        
        while (year == nil) {
            print("Enter year number: ", terminator: "")
            year = Int(readLine() ?? "")
            if (year == nil) {
                logError()
            }
        }
        
        guard (title != nil) && (author != nil) && (genre != nil) && (publicationYear != nil) && (year != nil) else {
            return false
        }
        
        let book = StudentBook(
            title: title!,
            author: author!,
            publicationYear: publicationYear!,
            genre: genre!,
            year: year!
        )
        
        lib.addBook(book)
        
        print("✅ Book added successfully!")
        
        return true
    }
}
