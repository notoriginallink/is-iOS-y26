public class PublicationYearCriteriaScenario: Scenario {
    public let name: String = "Publication year"
    
    private let scenario: SearchScenario
    
    init(scenario: SearchScenario) {
        self.scenario = scenario
    }
    
    public func run() -> Bool {
        OutputDriver.printPrompt("Enter publication year:")
        guard let year = Int(readLine() ?? "") else {
            return true
        }
        
        scenario.appendCriteria(PublicationYearCriteria(year))
        
        return true
    }
}
