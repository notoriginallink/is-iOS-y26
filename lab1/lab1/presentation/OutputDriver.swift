public class OutputDriver {
    static func printFoundBooks(_ books: [LibraryItem]) -> Void {
        print("🤓 Found \(books.count) books")
        
        var ind = 1
        for book in books {
            print("\(ind). " + book.getDescription())
            ind += 1
        }
    }
    
    static func printError(_ message: String) -> Void {
        print("🛑 " + message)
    }
    
    static func printSuccess(_ message: String) -> Void {
        print("✅ " + message)
    }
    
    static func printPrompt(_ message: String) -> Void {
        print(message)
        printInputForm()
    }
    
    static func printInputForm() -> Void {
        print(">>> ", terminator: "")
    }
}
