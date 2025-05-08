import UIKit

class CocktailCellView: UIView, ConfigurableView {
    typealias ViewModel = CocktailCellViewModel

    // MARK: - Properties
    private let image = UIImageView()
    private let name = DS.Label()
    private let imageManager: ImageManagerProtocol
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        self.imageManager = ImageManager()
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        self.imageManager = ImageManager()
        super.init(coder: coder)
        setupCell()
    }
    
    // MARK: - UI
    private func setupCell() {
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = false
        image.clipsToBounds = true
        addSubview(image)
        
        name.translatesAutoresizingMaskIntoConstraints = false
        addSubview(name)
        
        // Тени
        self.layer.shadowColor = DS.Colors.dark.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 3)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = false
        
        self.backgroundColor = .smokewhite
        self.clipsToBounds = false
        
        setupConstraints()
    }

    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            image.heightAnchor.constraint(equalToConstant: 60),
            image.widthAnchor.constraint(equalToConstant: 60),
            
            name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15),
            name.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    // MARK: - Methods
    func configure(with viewModel: CocktailCellViewModel) {
        name.configure(with: DS.LabelViewModel(
            text: viewModel.name,
            style: .primary,
            size: .large))
        imageManager.getImage(url: viewModel.imageUrl) { image in
            DispatchQueue.main.async {
                self.image.image = image
            }
        }
    }
}

