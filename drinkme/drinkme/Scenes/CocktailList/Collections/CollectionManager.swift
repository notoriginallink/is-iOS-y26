import UIKit

class CollectionManager<View: UIView & ConfigurableView>: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CollectionManagerProtocol {
    typealias View = View
    typealias ViewModel = View.ViewModel
    typealias Cell = GenericCell<View, ViewModel>

    private var items: [ViewModel] = []
    private weak var collectionView: UICollectionView?

    weak var delegate: CollectionManagerDelegate?

    func attach(to collectionView: UICollectionView) {
        self.collectionView = collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.reuseIdentifier)
    }

    func updateItems(_ items: [ViewModel]) {
        self.items = items
        DispatchQueue.main.async {
            self.collectionView?.dataSource = self
            self.collectionView?.reloadData()
        }
    }

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = items[indexPath.item]
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Cell.reuseIdentifier,
            for: indexPath
        ) as! Cell
        cell.configure(with: viewModel)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let collectionView = collectionView else { return }

        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = collectionView.frame.size.height

        if offsetY > contentHeight - height  {
            delegate?.didScrollToBottom()
        }
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    // Размеры ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 50
        let height: CGFloat = 100
        return CGSize(width: width, height: height)
    }
    
    // Отступы коллекции
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 25)
    }
    
    // расстояние между элементами
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("[DEBUG | CollectionManager]: didSelectItemAt \(indexPath.item)")
        delegate?.didSelectItem(with: indexPath.item)
    }
}


