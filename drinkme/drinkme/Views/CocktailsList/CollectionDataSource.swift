import UIKit

extension CocktailListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cocktails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CocktailCell.reuseIdentifier, for: indexPath) as! CocktailCell
        
        cell.configure(cocktails[indexPath.item])
        
        return cell
    }
}
