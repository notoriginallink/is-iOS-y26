import UIKit

class CocktailCellView: UICollectionViewCell, ConfigurableView {
    typealias ViewModel = CocktailCellViewModel

    // MARK: - Properties
    private let image = UIImageView()
    private let name = UILabel()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }
    
    // MARK: - UI
    private func setupCell() {
        // image
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        contentView.addSubview(image)
        
        // name
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        name.textColor = .dark
        contentView.addSubview(name)
        
        // cell
        self.layer.shadowColor = UIColor(named: "dark")?.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 3)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .smokewhite
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            image.heightAnchor.constraint(equalToConstant: 60),
            image.widthAnchor.constraint(equalToConstant: 60),
            
            name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15),
            name.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    // MARK: - Methods
    func configure(with viewModel: CocktailCellViewModel) {
        name.text = viewModel.name
        ImageManager.shared.getImage(url: viewModel.imageUrl) { image in
            DispatchQueue.main.async {
                self.image.image = image
            }
        }
    }
}

