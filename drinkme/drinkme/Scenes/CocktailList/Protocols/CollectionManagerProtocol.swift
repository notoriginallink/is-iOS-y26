import UIKit

/// Отвечает за работу с коллекцией коктейлей
protocol CollectionManagerProtocol: AnyObject {
    associatedtype View: UIView & ConfigurableView
    associatedtype ViewModel
    
    var delegate: CollectionManagerDelegate? { get set }
    
    func attach(to collectionView: UICollectionView)
    func updateItems(_ items: [ViewModel])
}

protocol CollectionManagerDelegate: AnyObject {
    func didSelectItem(with id: Int)
}

