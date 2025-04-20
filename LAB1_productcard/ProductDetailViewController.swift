import UIKit

class ProductDetailViewController: UIViewController {
    
    let productImageView = UIImageView()
    let productNameLabel = UILabel()
    let productDescriptionLabel = UILabel()
    let addToCartButton = UIButton(type: .system)
    let buttonContainerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    var productName: String = ""
    var productDescription: String = ""
    var productImage: UIImage?
    var productPrice: Double = 0.0
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    private func setupUI() {
        view.backgroundColor = .white
        
        setupFixedButton()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: buttonContainerView.topAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        productImageView.image = productImage
        productImageView.contentMode = .scaleAspectFit
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(productImageView)
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            productImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        productNameLabel.text = productName
        productNameLabel.numberOfLines = 2
        productNameLabel.font = UIFont.boldSystemFont(ofSize: 21)
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(productNameLabel)
        
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 16),
            productNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        productDescriptionLabel.text = productDescription
        productDescriptionLabel.numberOfLines = 0
        productDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(productDescriptionLabel)
        
        NSLayoutConstraint.activate([
            productDescriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 8),
            productDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            productDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    private func setupFixedButton() {
        buttonContainerView.backgroundColor = .white
        buttonContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonContainerView)
        
        buttonContainerView.layer.shadowColor = UIColor.black.cgColor
        buttonContainerView.layer.shadowOffset = CGSize(width: 0, height: -2)
        buttonContainerView.layer.shadowOpacity = 0.1
        buttonContainerView.layer.shadowRadius = 4
        
        addToCartButton.setTitle("В корзину - \(productPrice) ₽", for: .normal)
        addToCartButton.backgroundColor = .systemBrown
        addToCartButton.setTitleColor(.white, for: .normal)
        addToCartButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        addToCartButton.layer.cornerRadius = 8
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false
        addToCartButton.addTarget(self, action: #selector(addToCartTapped), for: .touchUpInside)
        buttonContainerView.addSubview(addToCartButton)
        
        NSLayoutConstraint.activate([
            buttonContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonContainerView.heightAnchor.constraint(equalToConstant: 80),
            
            addToCartButton.topAnchor.constraint(equalTo: buttonContainerView.topAnchor, constant: 8),
            addToCartButton.leadingAnchor.constraint(equalTo: buttonContainerView.leadingAnchor, constant: 16),
            addToCartButton.trailingAnchor.constraint(equalTo: buttonContainerView.trailingAnchor, constant: -16),
            addToCartButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func navigateToCart() {
        print("Типа перешли в корзину")
    }
    
    @objc private func addToCartTapped() {
        let alert = UIAlertController(
            title: "✅ Добавлено",
            message: "\(productName) теперь в корзине",
            preferredStyle: .alert
        )
        
        // Кнопки
        let continueAction = UIAlertAction(title: "Продолжить покупки", style: .default)
        let cartAction = UIAlertAction(title: "Перейти в корзину", style: .default) { _ in
            self.navigateToCart()
        }
        
        alert.addAction(continueAction)
        alert.addAction(cartAction)
        
        // Основной цвет для всех элементов
        alert.view.tintColor = UIColor(red: 0.55, green: 0.27, blue: 0.07, alpha: 1) // Коричневый
        
        present(alert, animated: true)
    }
}
