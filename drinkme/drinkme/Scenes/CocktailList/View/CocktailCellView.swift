import UIKit

class CocktailCellView: UIView, ConfigurableView {
    typealias ViewModel = CocktailCellViewModel

    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    
    func configure(with viewModel: CocktailCellViewModel) {
        titleLabel.text = viewModel.name
        // загружать картинку
    }
}

