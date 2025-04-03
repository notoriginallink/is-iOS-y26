import Foundation

class CocktailCacheItem {
    let createdAt: Date
    let cocktails: [Cocktail]
    
    init(createdAt: Date, cocktails: [Cocktail]) {
        self.createdAt = createdAt
        self.cocktails = cocktails
    }
}
