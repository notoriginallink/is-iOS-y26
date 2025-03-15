public class CompositeCriteria: Criteria {
    private var criterias: [Criteria]
    
    init(_ criterias: [Criteria]) {
        self.criterias = criterias
    }
    
    public static func of(_ criterias: Criteria...) -> CompositeCriteria {
        return CompositeCriteria(criterias)
    }
    
    public func matches(_ item: any LibraryItem) -> Bool {
        return criterias.allSatisfy({$0.matches(item)})
    }
    
    public func getDescription() -> String {
        return criterias.map({$0.getDescription()}).joined(separator: ", ")
    }
}
