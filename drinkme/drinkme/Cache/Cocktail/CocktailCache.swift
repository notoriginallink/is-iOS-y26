import Foundation

class CocktailCache: PagedCache {
    typealias T = Cocktail
    
    // MARK: - Properties
    private let cache = NSCache<NSString, CocktailCacheItem>()
    private var keys: Set<NSString> = []
    private let lifetime: TimeInterval
    private var cleanupTimer: Timer?
    
    init() {
        self.lifetime = 60 * 10 // 10 минут
        setupTimer()
    }
    
    init(lifetime: TimeInterval) {
        self.lifetime = lifetime
        setupTimer()
    }
    
    // MARK: - Methods
    func put(items: [Cocktail], page: Int, pageSize: Int) {
        let cacheKey = constructKey(page: page, pageSize: pageSize) as NSString
        let cacheItem = CocktailCacheItem(createdAt: Date(), cocktails: items)
        
        keys.insert(cacheKey)
        cache.setObject(cacheItem, forKey: cacheKey)
    }
    
    func get(page: Int, pageSize: Int) -> [Cocktail]? {
        let cacheKey = constructKey(page: page, pageSize: pageSize)
        return cache.object(forKey: cacheKey as NSString)?.cocktails
    }
    
    // MARK: - Private
    private func constructKey(page: Int, pageSize: Int) -> String {
        return "page\(page)_size\(pageSize)"
    }
    
    private func setupTimer() {
        cleanupTimer = Timer.scheduledTimer(withTimeInterval: lifetime, repeats: true) { [weak self] _ in
                self?.removeExpiredCache()
        }
    }
    
    private func removeExpiredCache() {
        let now = Date()
        keys
            .filter { key in
                guard let item = cache.object(forKey: key) else { return false }
                return now.timeIntervalSince(item.createdAt) > lifetime
            }.forEach{ key in
                cache.removeObject(forKey: key)
            }
    }
}
