public protocol Criteria: Descriptionable {
    func matches(_ item: LibraryItem) -> Bool
}
