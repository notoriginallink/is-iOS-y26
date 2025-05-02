import UIKit

/// Весь UI, относящийся к экрану c коктейлями
final class CocktailListView: UIView {
    
    // MARK: - Properties
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    var onRefresh: (() -> Void)?
    var onError: ((UIAlertController) -> Void)?
    
    private let refreshControl = UIRefreshControl()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setup() {
        backgroundColor = .smokewhite
        
        collectionView.backgroundColor = .smokewhite
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        addSubview(collectionView)

        refreshControl.addTarget(self, action: #selector(refreshTriggered), for: .valueChanged)
        collectionView.refreshControl = refreshControl
        
        setupConstraints()
    }
    
    private func setupConstraints()  {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    // MARK: - Actions
    @objc private func refreshTriggered() {
        onRefresh?()
    }

    func endRefreshing() {
        refreshControl.endRefreshing()
    }

    func setupError(message: String) {
        let alert = UIAlertController(title: "!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        onError?(alert)
    }
}
