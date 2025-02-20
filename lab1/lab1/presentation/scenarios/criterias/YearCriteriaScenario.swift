public class YearCriteriaScenario: Scenario {
    public let name: String = "Year (StudentBooks)"
    
    private let scenario: SearchScenario
    
    init(scenario: SearchScenario) {
        self.scenario = scenario
    }
    
    public func run() -> Bool {
        print("Enter year:\n>>> ", terminator: "")
        guard let year = Int(readLine() ?? "") else {
            return true
        }
        
        scenario.appendCriteria(YearNumberCriteria(year: year))
        
        return true
    }
}
