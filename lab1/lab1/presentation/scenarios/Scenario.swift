public protocol Scenario {
    var name: String { get }
    
    func run() -> Bool
}
