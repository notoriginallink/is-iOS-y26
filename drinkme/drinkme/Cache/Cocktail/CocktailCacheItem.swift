import Foundation

struct CocktailCacheItem: Expirable {
    var createdAt: Date
    let cocktails: [Cocktail]
}
