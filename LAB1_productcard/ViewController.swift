import UIKit

// Предположим, что это ваш текущий UIViewController
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        let button = UIButton(type: .system)
        button.setTitle("Перейти к товару", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(navigateToProductDetail), for: .touchUpInside)
        button.backgroundColor = .systemBrown
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 48)
        ])
      
    }
    
    @objc func navigateToProductDetail() {
       
        let productDetailVC = ProductDetailViewController()
        productDetailVC.productName = "Кожаные лоферы"
        productDetailVC.productDescription = """
        Лоферы из натуральной кожи. Фигурная союзка с фактурным швом по контуру. Зауженный мыс. Кожаная стелька и подкладка. Прорезиненная подошва. В комплект входит пыльник. 
        """
        productDetailVC.productImage = UIImage(named: "lofer")
        productDetailVC.productPrice = 14999
        productDetailVC.availableSizes = ["XXS", "XS", "S", "M", "L", "XL", "XXL"]
        productDetailVC.productSpecs = """
        • Материал: натуральная кожа
        • Подошва: резиновая
        • Цвет: чёрный
        • Страна производства: Россия
        """
        
        if let sheet = productDetailVC.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
        }
        
        present(productDetailVC, animated: true)
    }
}
