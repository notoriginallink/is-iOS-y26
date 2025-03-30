import Foundation

class CocktailCache: PagedCache {
    typealias T = Cocktail
    
    // MARK: - Properties
    private var cache: Dictionary<String, CocktailCacheItem> = [:]
    private let lifetime: TimeInterval
    
    // MARK: - Initializers
    init() {
        self.lifetime = 60 * 5 // 5 минут
    }
    
    init(lifetime: TimeInterval) {
        self.lifetime = lifetime
    }
    
    // MARK: - Methods
    func put(items: [Cocktail], page: Int, pageSize: Int) {
        let cacheKey = constructKey(page: page, pageSize: pageSize)
        let cacheItem = CocktailCacheItem(createdAt: Date(), cocktails: items)
        
        cache.updateValue(cacheItem, forKey: cacheKey)
    }
    
    func get(page: Int, pageSize: Int) -> [Cocktail]? {
        let cacheKey = constructKey(page: page, pageSize: pageSize)
        let cacheItem: CocktailCacheItem? = cache[cacheKey]
        
        guard let cacheItem = cacheItem else {
            return nil
        }
        
        if Date().timeIntervalSince(cacheItem.createdAt) < lifetime {
            return nil
        } else {
            return cacheItem.cocktails
        }
    }
    
    private func constructKey(page: Int, pageSize: Int) -> String {
        return "page\(page)_size\(pageSize)"
    }
}
