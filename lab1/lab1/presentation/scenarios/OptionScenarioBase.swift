public class OptionScenarioBase: Scenario {
    public var name: String = ""
    
    public func run() -> Bool {
        print(getOptionTitle())
        
        var ind = 1
        for scenario in getScenarios() {
            print("\(ind). \(scenario.name)")
            ind += 1
        }
        
        OutputDriver.printInputForm()
        let choice = Int(readLine() ?? "") ?? -1
        guard choice > 0 && choice <= getScenarios().count else {
            OutputDriver.printError("Incorrect option. Please try again")
            return self.run()
        }
        
        return getScenarios()[choice - 1].run()
    }
    
    func getOptionTitle() -> String {
        return ""
    }
    
    func getScenarios() -> [Scenario] {
        return []
    }
}
