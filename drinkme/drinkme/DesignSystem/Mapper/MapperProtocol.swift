import UIKit

extension DS {
    protocol MapperProtocol: AnyObject {
        /// Маппинг модели во View
        func map(from model: Model) throws -> UIView
    }
}

