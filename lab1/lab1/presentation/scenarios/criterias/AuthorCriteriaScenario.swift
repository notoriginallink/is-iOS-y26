public class AuthorCriteriaScenario: Scenario {
    public let name: String = "Author Criteria"
    
    private let scenario: SearchScenario
    
    init(scenario: SearchScenario) {
        self.scenario = scenario
    }
    
    public func run() -> Bool {
        print("Enter author:\n>>> ", terminator: "")
        guard let author = readLine() else {
            return true
        }
        
        scenario.appendCriteria(AuthorCriteria(author: author))
        
        return true
    }
}
