public protocol LibraryItem: Storable, Descriptionable {
    var title: String { get }
    var author: String { get }
    var publicationYear: Int { get }
    var genre: Genre { get }
}
