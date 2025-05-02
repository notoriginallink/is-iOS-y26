import UIKit

class ImageCache {
    
    // MARK: - Singleton
    static let shared: ImageCache = {
        return ImageCache()
    }()
    
    let cache = ExpirableCache<ImageCacheItem>()
    
    func put(image: UIImage, key: String) {
        cache.put(item: ImageCacheItem(createdAt: Date(), image: image), forKey: key)
    }
    
    func get(key: String) -> UIImage? {
        return cache.get(forKey: key)?.image
    }
}

extension ImageCache {
    class ImageCacheItem: Expirable {
        var createdAt: Date
        var image: UIImage
        
        init(createdAt: Date, image: UIImage) {
            self.createdAt = createdAt
            self.image = image
        }
    }
}
