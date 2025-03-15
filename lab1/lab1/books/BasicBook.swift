import Foundation

public class BasicBook: LibraryItem {
    public let title: String
    
    public let author: String
    
    public let publicationYear: Int
    
    public let genre: Genre
    
    public let id: UUID

    init(title: String, author: String, publicationYear: Int, genre: Genre) {
        self.title = title
        self.author = author
        self.publicationYear = publicationYear
        self.genre = genre
        self.id = UUID.init()
    }
    
    public func getDescription() -> String {
        return "(ID: \(id))\n\t'\(title)' by \(author)\n\tPub. in \(publicationYear)\n\tGenre: \(genre)"
    }
}
