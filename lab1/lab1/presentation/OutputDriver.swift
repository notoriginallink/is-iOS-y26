public class OutputDriver {
    static func printFoundBooks(_ books: [LibraryItem]) -> Void {
        print("🤓 Found \(books.count) books")
        
        var ind = 1
        for book in books {
            print("\(ind). " + book.getDescription())
            ind += 1
        }
    }
}
