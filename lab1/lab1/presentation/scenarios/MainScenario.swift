public class MainScenario: OptionScenarioBase {
    private var options: [Scenario]
    
    init(options: [Scenario]) {
        self.options = options
        super.init()
        name = "Welcome to Library Manager!"
    }
    
    override func getScenarios() -> [any Scenario] {
        return options
    }
    
    override func getOptionTitle() -> String {
        return name
    }
}
