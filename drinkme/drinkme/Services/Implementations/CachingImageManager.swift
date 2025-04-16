import UIKit

class ImageManager: ImageManagerProtocol {
    
    // MARK: - Singleton
    static let shared: ImageManager = {
        // Инициализация ImageManager с помощью зависимости networkHelper
        let networkHelper = NetworkHelper(session: URLSession(configuration: .default))
        return ImageManager(networkHelper: networkHelper)
    }()

    // MARK: - Dependencies
    private let cache = ExpirableCache<ImageCacheItem>()
    private let networkHelper: NetworkHelperProtocol
    
    // MARK: - Initializers
    init(networkHelper: NetworkHelperProtocol) {
        self.networkHelper = networkHelper
    }
    
    // MARK: - Methods
    func getImage(url: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = cache.get(forKey: url) {
            print("[INFO | ImageManager]: Cache hit for image URL=\(url)")
            completion(cachedImage.image)
            return
        }
        
        networkHelper.downloadImage(url: url, completion: { [weak self] result in
            switch result {
            case.success(let image):
                self?.cache.put(item: ImageCacheItem(createdAt: Date(), image: image), forKey: url)
                completion(image)
                return
            case.failure(_):
                completion(nil)
                return
            }
        })
    }
}

extension ImageManager {
    class ImageCacheItem: Expirable {
        var createdAt: Date
        var image: UIImage
        
        init(createdAt: Date, image: UIImage) {
            self.createdAt = createdAt
            self.image = image
        }
    }
}
