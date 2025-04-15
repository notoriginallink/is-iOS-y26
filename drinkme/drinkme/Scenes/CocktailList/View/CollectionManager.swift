import UIKit

class CollectionManager<View: UIView & ConfigurableView>: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
        print("[DEBUG | CollectionManager]: Call updateItems")
        self.items = items
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
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

    // MARK: - UICollectionViewDelegateFlowLayout (при необходимости)

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Сделай универсально или кастомизируй
        return CGSize(width: collectionView.bounds.width, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(with: indexPath.item)
    }
}

