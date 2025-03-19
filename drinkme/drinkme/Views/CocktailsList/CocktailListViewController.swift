import UIKit

class CocktailListViewController: UICollectionViewController {
    
    private let viewModel = CocktailListViewModel()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(coder: coder)
        self.collectionView.collectionViewLayout = layout
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CocktailCell.self, forCellWithReuseIdentifier: CocktailCell.reuseIdentifier)
        collectionView.backgroundColor = UIColor(named: "White")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cocktails.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CocktailCell.reuseIdentifier, for: indexPath) as! CocktailCell
        
        cell.configure(viewModel.cocktails[indexPath.item])
        
        return cell
    }
}


