public class AddBookScenario: OptionScenarioBase {
    
    private let lib: Library
    private let createScenarios: [Scenario]
    
    init(library: Library, bookCreateScenarios: [Scenario]) {
        lib = library
        createScenarios = bookCreateScenarios
        super.init()
        name = "Add new book"
    }
    
    override func getScenarios() -> [any Scenario] {
        return createScenarios
    }
    
    override func getOptionTitle() -> String {
        return "What kind of book you want to add?"
    }
}
