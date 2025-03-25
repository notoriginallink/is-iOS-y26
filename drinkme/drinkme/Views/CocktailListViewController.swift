import UIKit

class CocktailListViewController: UIViewController {
    
    // MARK: - Properties
    var cocktails: [CocktailViewModel] = [
        CocktailViewModel.createExample(),
        CocktailViewModel.createExample(),
        CocktailViewModel.createExample(),
        CocktailViewModel.createExample(),
        CocktailViewModel.createExample(),
        CocktailViewModel.createExample(),
        CocktailViewModel.createExample(),
        CocktailViewModel.createExample(),
        CocktailViewModel.createExample(),
        CocktailViewModel.createExample(),
    ]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    private let tabBar = UITabBar()
    
    // MARK: - Initialization
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI setup
    func setupUI() {
        view.backgroundColor = .smoke
        
        // collection view
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CocktailCell.self, forCellWithReuseIdentifier: CocktailCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .smoke
        view.addSubview(collectionView)
        
        // tab bar
        let homeItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "house"), tag: 0)
        let favoritesItem = UITabBarItem(title: "Избранное", image: UIImage(systemName: "star"), tag: 1)
        let profileItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 2)
        tabBar.items = [homeItem, favoritesItem, profileItem]
        tabBar.selectedItem = homeItem
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .dark
        appearance.stackedLayoutAppearance.selected.iconColor = .light
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.smoke]
        appearance.stackedLayoutAppearance.normal.iconColor = .smoke
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.smoke]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.smoke]
        tabBar.standardAppearance = appearance
        view.addSubview(tabBar)
        
        setupConstraints()
    }
    
    private func setupConstraints()  {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
            
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}


