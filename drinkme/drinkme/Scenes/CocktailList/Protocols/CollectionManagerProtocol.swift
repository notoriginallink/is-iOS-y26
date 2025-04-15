import UIKit

/// Отвечает за работу с коллекцией коктейлей
protocol CollectionManagerProtocol: AnyObject {
    var delegate: CollectionManagerDelegate? { get set }
    
    func attach(to collectionView: UICollectionView)
    func updateItems(_ items: [CocktailCellViewModelProtocol])
}

protocol CollectionManagerDelegate: AnyObject {
    func didSelectItem(with id: Int)
}

