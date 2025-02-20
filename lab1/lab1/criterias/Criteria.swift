public protocol Criteria: Descriptionable {
    func matches(item: LibraryItem) -> Bool
}
