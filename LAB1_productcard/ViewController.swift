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
        productDetailVC.productName = "Кастомизированные кроссовки от мастера"
        productDetailVC.productDescription = """
        Эти кроссовки — не просто обувь, а заряд энергии для твоего стиля! Сочетание свежего белого и сочного жёлтого создаёт яркий акцент, который мгновенно оживит любой образ — будь то повседневный лук, спортивный сет или даже что-то более смелое.

        Что делает их крутыми?
        ✔ Универсальность — белая основа легко комбинируется с чем угодно, а жёлтые детали добавляют дерзости.
        ✔ Комфорт на максимум — лёгкая подошва с амортизацией, дышащий материал и удобная колодка для долгих прогулок.
        ✔ Детали, которые цепляют — может, это контрастные шнурки, рельефный логотип или фактурная строчка — в них точно есть изюминка.

        Для кого?
        Для тех, кто не боится выделяться, любит удобство и хочет добавить в свою повседневность немного солнечного настроения. Носи с джинсами, шортами или даже спортивными брюками — они везде будут смотреться огненно!

        Коротко: если бы кроссовки могли улыбаться, эти бы сияли во весь рот. 😎
        """
        productDetailVC.productImage = UIImage(named: "sneakers_custom_1")
        productDetailVC.productPrice = 1999.99
        
        navigationController?.pushViewController(productDetailVC, animated: true)
    }
}
