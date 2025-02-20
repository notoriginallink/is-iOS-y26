import Foundation
public class ComicBook: BasicBook {
    
    public private(set) var issue: Int
    
    init(title: String, author: String, publicationYear: Int, genre: Genre, issue: Int) {
        self.issue = issue
        super.init(title: title, author: author, publicationYear: publicationYear, genre: genre)
    }
    
    public override func getDescription() -> String {
        return super.getDescription() + "\n\tIssue: \(issue)"
    }
}
