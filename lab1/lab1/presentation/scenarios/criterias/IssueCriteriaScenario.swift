public class IssueCriteriaScenario: Scenario {
    public let name: String = "Issue (Comics)"
    
    private let scenario: SearchScenario
    
    init(scenario: SearchScenario) {
        self.scenario = scenario
    }
    
    public func run() -> Bool {
        OutputDriver.printPrompt("Enter issue number:")
        guard let issue = Int(readLine() ?? "") else {
            return true
        }
        
        scenario.appendCriteria(IssueNumberCriteria(issue: issue))
        
        return true
    }
}
