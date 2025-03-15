import Foundation

func main() {
    let shelf: Library = BookShelf()
    
    let b1984 = BasicBook(title: "1984", author: "George Orwell", publicationYear: 1984, genre: .fiction)
    let b1985 = BasicBook(title: "1985", author: "Anthony Burgess", publicationYear: 1978, genre: .nonFiction)
    
    shelf.addBook(b1984)
    shelf.addBook(b1985)
    
    let menu = MainScenario(options: [
        AddBookScenario(library: shelf, bookCreateScenarios: [
            BasicBookCreateScenario(library: shelf),
            ComicBookCreateScenario(library: shelf),
            StudentBookCreateScenario(library: shelf)
        ]),
        FindMenuScenario(library: shelf),
        GetAllScenario(library: shelf),
        DeleteByIdScenario(library: shelf),
        ExitScenario()
    ])
    
    while menu.run() { }
}

main()
