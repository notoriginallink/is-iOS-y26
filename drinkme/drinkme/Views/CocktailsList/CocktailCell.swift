import UIKit

class CocktailCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CocktailCell"
    
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
    
    private func setupCell() {
        // image
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)
        
        // name
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        name.textColor = .dark
        contentView.addSubview(name)
        
        // cell
        self.layer.cornerRadius = 15
        self.layer.shadowColor = UIColor(named: "dark")?.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 3)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
        self.backgroundColor = .smoke
        
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
    
    public func configure(_ cocktail: CocktailViewModel) {
        name.text = cocktail.name
        image.image = UIImage(named: cocktail.imageName)
    }
}
