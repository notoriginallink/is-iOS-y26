public class YearCriteriaScenario: Scenario {
    public let name: String = "Year (StudentBooks)"
    
    private let scenario: SearchScenario
    
    init(scenario: SearchScenario) {
        self.scenario = scenario
    }
    
    public func run() -> Bool {
        OutputDriver.printPrompt("Enter year:")
        guard let year = Int(readLine() ?? "") else {
            return true
        }
        
        scenario.appendCriteria(YearNumberCriteria(year))
        
        return true
    }
}
