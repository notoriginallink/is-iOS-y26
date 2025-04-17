import UIKit

/// Обобщенный тип ячейки для коллекции
class GenericCell<View: UIView & ConfigurableView, ViewModel>: UICollectionViewCell where View.ViewModel == ViewModel {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    // MARK: - Properties
    private let customView = View()
    
    // MARK: - Initializers
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    // MARK: - Methods
    func configure(with viewModel: ViewModel) where ViewModel == View.ViewModel {
        customView.configure(with: viewModel)
    }
}
