import UIKit

class ImageManager: ImageManagerProtocol {

    // MARK: - Properties
    private let cache = NSCache<NSString, UIImage>()
    
    // MARK: - Dependencies
    private let networkHelper: NetworkHelperProtocol
    
    // MARK: - Initializers
    init(networkHelper: NetworkHelperProtocol) {
        self.networkHelper = networkHelper
    }
    
    // MARK: - Methods
    func getImage(url: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = cache.object(forKey: url as NSString) {
            completion(cachedImage)
            return
        }
        
        networkHelper.downloadImage(endpoint: url, completion: { (result: Result<UIImage, Error>) in
            switch result {
            case.success(let image):
                self.cache.setObject(image, forKey: url as NSString)
                completion(image)
                return
            case.failure(let error):
                completion(nil)
                return
            }
        })
    }
}
