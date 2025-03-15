public class AppendCriteriaScenario: OptionScenarioBase {

    private let criterias: [Scenario]
    
    public init(criterias: [Scenario]) {
        self.criterias = criterias
        super.init()
        name = "Append new criteria"
    }
    
    override func getOptionTitle() -> String {
        return "Choose criteria to append: "
    }
    
    override func getScenarios() -> [any Scenario] {
        return criterias
    }
}
