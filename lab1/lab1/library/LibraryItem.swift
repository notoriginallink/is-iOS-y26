public protocol LibraryItem: Storable {
    var title: String { get }
    var author: String { get }
    var publicationYear: Int { get }
    var genre: Genre { get }
}
