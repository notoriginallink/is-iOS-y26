import Foundation

public class DeleteByIdScenario: Scenario {
    public let name: String = "Delete book"
    
    private let lib: Library
    
    init(library: Library) {
        lib = library
    }
    
    public func run() -> Bool {
        print("Enter ID of book to delete: ", terminator: "")
        if let idString = readLine(), let id = UUID.init(uuidString: idString) {
            do {
                try lib.removeBook(id)
                print("Book deleted successfully.")
                return true
            } catch {
                print("Error: \(error)")
                return false
            }
        } else {
            print("🛑 Invalid ID. Please try again")
            return true
        }
    }
}
