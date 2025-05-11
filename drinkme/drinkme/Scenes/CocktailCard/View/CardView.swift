import UIKit

class CardView: UIView, ConfigurableView {
    typealias ViewModel = CardViewModel
    
    // MARK: - Properties
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let cocktailImageView = UIImageView()
    private let nameLabel = DS.Label()
    private let descriptionLabel = DS.Label()
    private let ingredientsHeaderLabel = DS.Label(viewModel: DS.LabelViewModel(
        text: "Ингредиенты",
        style: .primary,
        size: .large))
    private let ingredientsStackView = DS.Stack()
    private let gearHeaderLabel = DS.Label(viewModel: DS.LabelViewModel(
        text: "Инструменты",
        style: .primary,
        size: .large))
    private let gearStackView = DS.Stack()
    
    // MARK: - Dependencies
    private let imageManager: ImageManagerProtocol
    
    // MARK: - Init
    override init(frame: CGRect) {
        imageManager = ImageManager()
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        backgroundColor = .smokewhite
        
        // setup scrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        // setup image
        cocktailImageView.translatesAutoresizingMaskIntoConstraints = false
        cocktailImageView.contentMode = .scaleAspectFit
        cocktailImageView.backgroundColor = .smokewhite
        contentView.addSubview(cocktailImageView)
        
        // setup name
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        // setup description
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        
        // setup ingredients header
        ingredientsHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ingredientsHeaderLabel)
        
        // setup ingredients
        ingredientsStackView.translatesAutoresizingMaskIntoConstraints = false
        ingredientsStackView.axis = .vertical
        ingredientsStackView.spacing = 12
        ingredientsStackView.alignment = .fill
        ingredientsStackView.distribution = .fill
        contentView.addSubview(ingredientsStackView)
        
        // setup gear header
        gearHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(gearHeaderLabel)
        
        // setup gear
        gearStackView.translatesAutoresizingMaskIntoConstraints = false
        gearStackView.axis = .vertical
        gearStackView.spacing = 12
        gearStackView.alignment = .fill
        gearStackView.distribution = .fill
        contentView.addSubview(gearStackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // scrollView
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // contentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // image
            cocktailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            cocktailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cocktailImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cocktailImageView.heightAnchor.constraint(equalTo: cocktailImageView.widthAnchor, multiplier: 0.75),
            
            // name
            nameLabel.topAnchor.constraint(equalTo: cocktailImageView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            // description
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            // ingredient`s header
            ingredientsHeaderLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            ingredientsHeaderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            ingredientsHeaderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            // ingredients
            ingredientsStackView.topAnchor.constraint(equalTo: ingredientsHeaderLabel.bottomAnchor, constant: 12),
            ingredientsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            ingredientsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            // gear header
            gearHeaderLabel.topAnchor.constraint(equalTo: ingredientsStackView.bottomAnchor, constant: 24),
            gearHeaderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            gearHeaderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            // gear
            gearStackView.topAnchor.constraint(equalTo: gearHeaderLabel.bottomAnchor, constant: 12),
            gearStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            gearStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            gearStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    // MARK: - Methods
    func configure(with viewModel: ViewModel) {
        guard let cocktail = viewModel.cocktail else {
            return
        }
        
        nameLabel.configure(with: DS.LabelViewModel(text: cocktail.name, style: .primary, size: .large))
        descriptionLabel.configure(with: DS.LabelViewModel(text: cocktail.description, style: .secondary, size: .small))
        
        imageManager.getImage(url: cocktail.imageUrl) { [weak self] image in
            DispatchQueue.main.async {
                self?.cocktailImageView.image = image
            }
        }
        
        // Create ingredients items
        for ingredient in cocktail.ingredients {
            let ingredientView = createIngredientView(name: ingredient.name, amount: "\(ingredient.amount) \(ingredient.unit)")
            ingredientsStackView.addArrangedSubview(ingredientView)
        }
        
        // Create gear items
        for item in cocktail.gear {
            let itemView = createGearItemView(name: item.name)
            gearStackView.addArrangedSubview(itemView)
        }
    }
    
    // MARK: - helper method for UI components
    private func createIngredientView(name: String, amount: String) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 12
        
        let nameLabel = DS.Label(viewModel: DS.LabelViewModel(
            text: name,
            style: .primary,
            size: .medium))
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let amountLabel = DS.Label(viewModel: DS.LabelViewModel(
            text: amount,
            style: .primary,
            size: .medium))
        amountLabel.translatesAutoresizingMaskIntoConstraints = false

        containerView.addSubview(nameLabel)
        containerView.addSubview(amountLabel)
        
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            nameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: amountLabel.leadingAnchor, constant: -16),
            
            amountLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            amountLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor)
        ])
        
        return containerView
    }
    
    private func createGearItemView(name: String) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 12
        
        let nameLabel = DS.Label(viewModel: DS.LabelViewModel(
            text: name,
            style: .primary,
            size: .medium))
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            nameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ])
        
        return containerView
    }
}
