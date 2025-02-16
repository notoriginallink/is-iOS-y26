import Foundation

public class BasicBook: LibraryItem {
    public private(set) var title: String
    
    public private(set) var author: String
    
    public private(set) var publicationYear: Int
    
    public private(set) var genre: Genre
    
    public private(set) var id: UUID

    init(title: String, author: String, publicationYear: Int, genre: Genre) {
        self.title = title
        self.author = author
        self.publicationYear = publicationYear
        self.genre = genre
        self.id = UUID.init()
    }

}
