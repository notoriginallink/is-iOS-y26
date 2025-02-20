public class GenreCriteriaScenario: Scenario {
    public let name: String = "Genre Criteria"
    
    private let scenario: SearchScenario
    
    init(scenario: SearchScenario) {
        self.scenario = scenario
    }
    
    public func run() -> Bool {
        OutputDriver.printPrompt("Enter genre:")
        let input = readLine()
        guard (input != nil) else {
            return false
        }
        
        guard let genre = Genre(rawValue: input!.lowercased().trimmingCharacters(in: .whitespaces)) else {
            return true
        }
        print(genre)
        scenario.appendCriteria(GenreCriteria(genre: genre))
        
        return true
    }
}
