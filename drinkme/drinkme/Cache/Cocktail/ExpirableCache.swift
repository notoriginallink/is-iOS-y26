import Foundation

class ExpirableCache<T: Expirable> {
    
    // MARK: - Properties
    private let cache = NSCache<NSString, T>()
    private var keys: Set<NSString> = []
    private let lifetime: TimeInterval
    private var cleanupTimer: Timer?

    // MARK: - Initializators
    init(lifetime: TimeInterval = 60 * 10) {
        self.lifetime = lifetime
        setupTimer()
    }

    // MARK: - Methods
    func put(item: T, forKey key: String) {
        let nsKey = key as NSString
        keys.insert(nsKey)
        cache.setObject(item, forKey: nsKey)
    }

    func get(forKey key: String) -> T? {
        let nsKey = key as NSString
        guard let item = cache.object(forKey: nsKey) else { return nil }
        return Date().timeIntervalSince(item.createdAt) < lifetime ? item : nil
    }

    // MARK: - Private
    private func setupTimer() {
        cleanupTimer = Timer.scheduledTimer(withTimeInterval: lifetime, repeats: true) { [weak self] _ in
            self?.removeExpiredCache()
        }
    }

    private func removeExpiredCache() {
        let now = Date()
        keys = keys.filter { key in
            guard let item = cache.object(forKey: key) else { return false }
            let isExpired = now.timeIntervalSince(item.createdAt) > lifetime
            if isExpired { cache.removeObject(forKey: key) }
            return !isExpired
        }
    }
}
