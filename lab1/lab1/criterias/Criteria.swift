public protocol Criteria {
    func matches(item: LibraryItem) -> Bool
}
