import UIKit

class CocktailCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CocktailCell"
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        text.textColor = .background
        return text
    }()
    
    private let desc: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 16)
        text.textColor = .background
        return text
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        
        contentView.addSubview(image)
        contentView.addSubview(nameText)
        contentView.addSubview(desc)
        
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
            image.heightAnchor.constraint(equalToConstant: 80),
            image.widthAnchor.constraint(equalToConstant: 80),
            
            nameText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameText.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15),
            nameText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            desc.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 20),
            desc.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15),
            desc.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }
    
    private func setupCell() {
        self.layer.cornerRadius = 15
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 3)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.2
        self.layer.masksToBounds = false
        self.backgroundColor = UIColor(named: "BackgroundWhite") // замените на свой цвет
    }
    
    public func configure(_ cocktail: Cocktail) {
        nameText.text = cocktail.name
        image.image = UIImage(named: cocktail.image ?? "BostonTee")
        desc.text = cocktail.description
    }
}
