public class SearchScenario: Scenario {
    public var name: String = "Search"
    
    private let lib: Library
    private var criterias: [Criteria] = []
    
    init(library: Library) {
        self.lib = library
    }
    
    public func run() -> Bool {
        let composite = CompositeCriteria(criterias)
        let items = lib.findBooksByCriteria(composite)
    
        OutputDriver.printFoundBooks(items)
        
        return true
    }
    
    func appendCriteria(_ criteria: Criteria) {
        criterias.append(criteria)
    }
    
    func flushCriterias() -> Void {
        criterias.removeAll()
    }
    
    func getCriterias() -> [Criteria] {
        return criterias
    }
}
