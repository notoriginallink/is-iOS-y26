import UIKit

class ImageManager: ImageManagerProtocol {
    
    // MARK: - Dependencies
    private let networkHelper: NetworkHelperProtocol
    
    // MARK: - Initializers
    init(networkHelper: NetworkHelperProtocol = NetworkHelper(session: .shared)) {
        self.networkHelper = networkHelper
    }
    
    // MARK: - Methods
    func getImage(url: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = ImageCache.shared.get(key: url) {
            print("[INFO | ImageManager]: Cache hit for image URL=\(url)")
            completion(cachedImage)
            return
        }
        
        networkHelper.downloadImage(url: url, completion: { result in
            switch result {
            case.success(let image):
                ImageCache.shared.put(image: image, key: url)
                completion(image)
                return
            case.failure(_):
                completion(nil)
                return
            }
        })
    }
}
