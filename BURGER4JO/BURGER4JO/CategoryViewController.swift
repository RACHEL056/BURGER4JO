//
//  CategoryViewController.swift
//  BURGER4JO
//
//  Created by t2023-m0023 on 2023/12/28.
//

import UIKit

class CategoryViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var burgerButton: UIButton!
    @IBOutlet weak var sideButton: UIButton!
    @IBOutlet weak var drinkButton: UIButton!
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Background Color
        view.backgroundColor = UIColor(#colorLiteral(red: 1, green: 0.6729137301, blue: 0.3843368888, alpha: 1))
        
        // MARK: - Image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(named: "image") {
            imageView.image = image
        }
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
       
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: burgerButton.bottomAnchor, constant: 23),
            imageView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -450)
            //나중에 병합 후에는 bottomAnchor의 constraint를 바꿔야할 수도?
        ])
        
        // MARK: - Button Setup
        setupButton(burgerButton, title: "버거")
        setupButton(sideButton, title: "사이드")
        setupButton(drinkButton, title: "음료")
       
        // MARK: - AutoLayout
        // 버거 constraints
        NSLayoutConstraint.activate([
            burgerButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            burgerButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            burgerButton.trailingAnchor.constraint(equalTo: sideButton.leadingAnchor, constant: -10),
            burgerButton.widthAnchor.constraint(equalTo: sideButton.widthAnchor)
        ])
        
        // 사이드 constraints
        NSLayoutConstraint.activate([
            sideButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            sideButton.leadingAnchor.constraint(equalTo: burgerButton.trailingAnchor),
            sideButton.trailingAnchor.constraint(equalTo: drinkButton.leadingAnchor, constant: -10),
            sideButton.widthAnchor.constraint(equalTo: drinkButton.widthAnchor)
        ])
        
        // 음료 constraints
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
        
    }
    // MARK: - Button Setup Function
    // 버튼 설정 함수
    func setupButton(_ button: UIButton, title: String) {
        button.backgroundColor = UIColor(#colorLiteral(red: 0.8256652951, green: 0.3247050941, blue: 0.2389631867, alpha: 1))
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
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
