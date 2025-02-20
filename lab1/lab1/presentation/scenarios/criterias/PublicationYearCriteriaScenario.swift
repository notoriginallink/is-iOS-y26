public class PublicationYearCriteriaScenario: Scenario {
    public let name: String = "Publication year"
    
    private let scenario: SearchScenario
    
    init(scenario: SearchScenario) {
        self.scenario = scenario
    }
    
    public func run() -> Bool {
        print("Enter publication year:\n>>> ", terminator: "")
        guard let year = Int(readLine() ?? "") else {
            return true
        }
        
        scenario.appendCriteria(PublicationYearCriteria(publicationYear: year))
        
        return true
    }
}
