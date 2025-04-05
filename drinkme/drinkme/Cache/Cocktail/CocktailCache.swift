import Foundation

class CocktailCache: PagedCache {
    typealias T = Cocktail
    
    // MARK: - Properties
    private let cache = ExpirableCache<CocktailCacheItem>()
    
    // MARK: - Methods
    func put(items: [Cocktail], page: Int, pageSize: Int) {
        let cacheKey = constructKey(page: page, pageSize: pageSize)
        cache.put(item: CocktailCacheItem(createdAt: Date(), cocktails: items), forKey: cacheKey)
    }
    
    func get(page: Int, pageSize: Int) -> [Cocktail]? {
        let cacheKey = constructKey(page: page, pageSize: pageSize)
        return cache.get(forKey: cacheKey)?.cocktails
    }
    
    // MARK: - Private
    private func constructKey(page: Int, pageSize: Int) -> String {
        return "page\(page)_size\(pageSize)"
    }
}

extension CocktailCache {
    class CocktailCacheItem: Expirable {
        let createdAt: Date
        let cocktails: [Cocktail]
        
        init(createdAt: Date, cocktails: [Cocktail]) {
            self.createdAt = createdAt
            self.cocktails = cocktails
        }
    }
}
