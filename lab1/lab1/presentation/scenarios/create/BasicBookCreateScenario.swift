public class BasicBookCreateScenario: BookCreateScenarioBase {
    
    override init(library: Library) {
        super.init(library: library)
        name = "Basic book"
    }
    
    public override func buildBook() -> LibraryItem? {
        return BasicBook(title: title!, author: author!, publicationYear: publicationYear!, genre: genre!)
    }
    
    public override func reset() {
        super.reset()
    }
}
