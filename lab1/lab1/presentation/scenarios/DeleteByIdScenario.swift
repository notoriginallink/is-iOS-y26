import Foundation

public class DeleteByIdScenario: Scenario {
    public let name: String = "Delete book"
    
    private let lib: Library
    
    init(library: Library) {
        lib = library
    }
    
    public func run() -> Bool {
        OutputDriver.printPrompt("Enter ID of book to delete:")
        if let idString = readLine(), let id = UUID.init(uuidString: idString) {
            lib.removeBook(id: id)
            OutputDriver.printSuccess("Book deleted successfully.")
        } else {
            OutputDriver.printError("Invalid ID. Please try again")
        }
        return true
    }
}
