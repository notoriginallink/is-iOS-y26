public class BookCreateScenarioBase: Scenario {
    public var name: String = ""
    
    var title: String? = nil
    var author: String? = nil
    var genre: Genre? = nil
    var publicationYear: Int? = nil
    
    public func run() -> Bool {
        
        return true
    }
    
    func buildBasic() -> Void {
        while (title == nil) {
            print("Enter book name: ", terminator: "")
            title = readLine()
            if (title == nil) {
                logError()
            }
        }
        
        while (author == nil) {
            print("Enter book author: ", terminator: "")
            author = readLine()
            if (author == nil) {
                logError()
            }
        }
        
        while (publicationYear == nil) {
            print("Enter book publication year: ", terminator: "")
            publicationYear = Int(readLine() ?? "")
            if (publicationYear == nil) {
                logError()
            }
        }
        
        while (genre == nil) {
            print("Enter book genre (\(Genre.allCases.map({$0.rawValue})): ", terminator: "")
            genre = Genre(rawValue: readLine() ?? "")
            if (genre == nil) {
                logError()
            }
        }
    }
    
    func reset() {
        title = nil
        author = nil
        genre = nil
        publicationYear = nil
    }
    
    func logError() {
        print("🛑 Invalid parameters. Please try again")
    }
}
