
import UIKit


// 임시 구조체
struct Menu {
    let name: String
    let price: Int
    var quantity: Int
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //하단의 취소/결제 버튼 동작
    @IBAction func cancelAlertButton(_ sender: Any) {
        let title = "주문을 취소하시겠습니까?"
        let message = "주문을 취소하실 경우 확인을 눌러주세요"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

            //되돌아가기 기능
        let back = UIAlertAction(title: "취소", style: .cancel)
            //취소 확인 기능 - 이후에 장바구니에 담긴 항목들이 사라지도록 만들면 좋을 것 같음
        let cancelOK = UIAlertAction(title: "확인", style: .default)

        alert.addAction(back)
        alert.addAction(cancelOK)
        
        present(alert, animated: true, completion: nil)
        }

    @IBAction func orderAlertButton(_ sender: Any) {
        let title = "결제하시겠습니까?"
        let message = "장바구니에 담은 항목을 결제하실 경우 확인을 눌러주세요"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

            //되돌아가기 기능
        let back = UIAlertAction(title: "취소", style: .cancel)
            //주문 결제 기능 - 이후에 총 결제 금액을 띄우는 창이라던지, 기능 구상 필요
        let orderOK = UIAlertAction(title: "확인", style: .default)

        alert.addAction(back)
        alert.addAction(orderOK)
        
        present(alert, animated: true, completion: nil)
        }
 
    // MARK: - Properties
    
    // -------- tableView IBOutlet
    @IBOutlet weak var tableView: UITableView!
    // tableView 임시 메뉴 세팅
    var menuItems: [Menu] = [
        Menu(name: "불고기 버거", price: 2500, quantity: 0),
        Menu(name: "치즈 버거", price: 3000, quantity: 0),
        Menu(name: "사이다", price: 1500, quantity: 0)
    ]
    
    // Category properties
    let burgerButton = UIButton()
    let sideButton = UIButton()
    let drinkButton = UIButton()
    let imageView = UIImageView()
    
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Background Color
        view.backgroundColor = UIColor(#colorLiteral(red: 1, green: 0.6729137301, blue: 0.3843368888, alpha: 1))
        
        // MARK: - Button Setup
        // 순서가 중요 - constraints를 설정하기 전에 먼저 버튼을 설정해야함
        setupButton(burgerButton, title: "버거")
        setupButton(sideButton, title: "사이드")
        setupButton(drinkButton, title: "음료")
        
        // MARK: - Image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(named: "image") {
            imageView.image = image
        }
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        
        // imageView를 superView가 리사이징 될 때 같이 리사이징 되도록 설정
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
       
        // MARK: - AutoLayout
        // 이미지 constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: burgerButton.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -300)
            //나중에 병합 후에는 이미지뷰의 bottomAnchor의 constraint를 바꿔야할 수도?
        ])
        
        // 버거 버튼 constraints
        NSLayoutConstraint.activate([
            burgerButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            burgerButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            burgerButton.trailingAnchor.constraint(equalTo: sideButton.leadingAnchor, constant: -10),
            burgerButton.widthAnchor.constraint(equalTo: sideButton.widthAnchor)
        ])
        
        // 사이드 버튼 constraints
        NSLayoutConstraint.activate([
            sideButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            sideButton.leadingAnchor.constraint(equalTo: burgerButton.trailingAnchor),
            sideButton.trailingAnchor.constraint(equalTo: drinkButton.leadingAnchor, constant: -10),
            sideButton.widthAnchor.constraint(equalTo: drinkButton.widthAnchor)
        ])
        
        // 음료 버튼 constraints
        NSLayoutConstraint.activate([
            drinkButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            drinkButton.leadingAnchor.constraint(equalTo: sideButton.trailingAnchor),
            drinkButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            drinkButton.widthAnchor.constraint(equalTo: burgerButton.widthAnchor)
        ])
        
        // MARK: - Button Action
        burgerButton.addTarget(self, action: #selector(didTapBurgerButton), for: .touchUpInside)
        sideButton.addTarget(self, action: #selector(didTapSideButton), for: .touchUpInside)
        drinkButton.addTarget(self, action: #selector(didTapDrinkButton), for: .touchUpInside)
        
        
        // ----------tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
        
        
    }
    // ----------tableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        
        let menuItem = menuItems[indexPath.row]
        cell.textLabel?.text = "\(menuItem.name) | $\(menuItem.price) | 수량: \(menuItem.quantity)"
        cell.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        cell.textLabel?.textColor = .black

        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            menuItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // MARK: - Button Action Function
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        quantityAlert(for: indexPath)
    }
    
    func quantityAlert(for indexPath: IndexPath) {
        let alertController = UIAlertController(title: "수량 변경", message: "수량을 입력하세요.", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "수량"
            textField.keyboardType = .numberPad
        }
        
        let confirmAction = UIAlertAction(title: "확인", style: .default) { [weak self] _ in
            guard let quantityString = alertController.textFields?.first?.text,
                  let quantity = Int(quantityString) else { return }
            
            self?.menuItems[indexPath.row].quantity = quantity
            self?.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    

    // MARK: - Button Setup Function
    // 버튼 설정 함수
    func setupButton(_ button: UIButton, title: String) {
        button.backgroundColor = UIColor(#colorLiteral(red: 0.8256652951, green: 0.3247050941, blue: 0.2389631867, alpha: 1))
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
    }
    
    // MARK: - Button Helper
    // 세부 메뉴를 보여줌 - BurgerViewController() 창이 팝업된다
    @objc func didTapBurgerButton() {
        let burgerVc = BurgerViewController()
        self.present(burgerVc, animated: true, completion: nil)
    }
    // SideViewController()
    @objc func didTapSideButton() {
        let sideVc = SideViewController()
        self.present(sideVc, animated: true, completion: nil)
    }
    // drinkViewController()
    @objc func didTapDrinkButton() {
        let drinkVc = DrinkViewController()
        self.present(drinkVc, animated: true, completion: nil)
    }
}
