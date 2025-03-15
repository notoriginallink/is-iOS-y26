public class FlushCriteriaScenario: Scenario {
    
    public var name: String = "Remove all criterias"
    
    private let searchScenario: SearchScenario
    
    public init(searchScenario: SearchScenario) {
        self.searchScenario = searchScenario
    }
    
    public func run() -> Bool {
        searchScenario.flushCriterias()
        return true
    }
}
