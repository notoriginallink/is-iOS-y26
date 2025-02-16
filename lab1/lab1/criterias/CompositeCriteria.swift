public class CompositeCriteria: Criteria {
    private var criterias: [Criteria]
    
    init(criterias: [Criteria]) {
        self.criterias = criterias
    }
    
    public static func of(_ criterias: Criteria...) -> CompositeCriteria {
        return CompositeCriteria(criterias: criterias)
    }
    
    public func matches(item: any LibraryItem) -> Bool {
        return criterias.allSatisfy({$0.matches(item: item)})
    }
}
