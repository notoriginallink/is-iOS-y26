public class AuthorCriteriaScenario: Scenario {
    public let name: String = "Author Criteria"
    
    private let scenario: SearchScenario
    
    init(scenario: SearchScenario) {
        self.scenario = scenario
    }
    
    public func run() -> Bool {
        OutputDriver.printPrompt("Enter author:")
        guard let author = readLine() else {
            return true
        }
        
        scenario.appendCriteria(AuthorCriteria(author))
        
        return true
    }
}
