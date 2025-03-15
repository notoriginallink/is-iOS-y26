public class StudentBook: BasicBook {
    public private(set) var year: Int
    
    init(title: String, author: String, publicationYear: Int, genre: Genre, year: Int) {
        self.year = year
        super.init(title: title, author: author, publicationYear: publicationYear, genre: genre)
    }
    
    public override func getDescription() -> String {
        return super.getDescription() + "\n\tYear: \(year)"
    }
}
