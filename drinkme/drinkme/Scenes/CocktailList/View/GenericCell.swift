import UIKit

/// Обобщенный тип ячейки для коллекции
class GenericCell<View: UIView & ConfigurableView, ViewModel>: UICollectionViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    // MARK: - Properties
    private let customView: View
    
    // MARK: - Initializers
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func configure(with viewModel: ViewModel) where ViewModel == View.ViewModel {
        customView.configure(with: viewModel)
    }
}
