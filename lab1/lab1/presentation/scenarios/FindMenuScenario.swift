public class FindMenuScenario: OptionScenarioBase {
    
    private var lib: Library
    private var options: [Scenario]
    private let searchScenario: SearchScenario
    
    init(library: Library) {
        lib = library
        options = []
        searchScenario = SearchScenario(library: lib)
        
        super.init()
        
        name = "Find book"
        let flushCriteriaScenario = FlushCriteriaScenario(searchScenario: searchScenario)
        let appendCriteriaScenario = AppendCriteriaScenario(criterias: [
            TitleCriteriaScenario(scenario: searchScenario),
            AuthorCriteriaScenario(scenario: searchScenario),
            PublicationYearCriteriaScenario(scenario: searchScenario),
            GenreCriteriaScenario(scenario: searchScenario),
            IssueCriteriaScenario(scenario: searchScenario),
            YearCriteriaScenario(scenario: searchScenario)
        ])
        
        options = [
            appendCriteriaScenario,
            searchScenario,
            flushCriteriaScenario
        ]
    }
    
    override func getScenarios() -> [any Scenario] {
        return options
    }
    
    override func getOptionTitle() -> String {
        let criterias = searchScenario.getCriterias()
        return "Currently \(criterias.count) criterias applied"
            + (criterias.isEmpty
               ? ""
               : "\n" + criterias.map({"- " + $0.getDescription()}).joined(separator: "\n"))
    }
}
