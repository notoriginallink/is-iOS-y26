public class TitleCriteriaScenario: Scenario {
    public let name: String = "Title Criteria"
    
    private let scenario: SearchScenario
    
    init(scenario: SearchScenario) {
        self.scenario = scenario
    }
    
    public func run() -> Bool {
        OutputDriver.printPrompt("Enter title:")
        guard let title = readLine() else {
            return true
        }
        
        scenario.appendCriteria(TitleCriteria(title))
        
        return true
    }
}
