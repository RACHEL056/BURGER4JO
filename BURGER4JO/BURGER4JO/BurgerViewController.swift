//
//  BurgerViewController.swift
//  BURGER4JO
//
//  Created by 김우경 on 12/27/23.
//

import UIKit

class BurgerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let menuList = ["BulgogiBurger", "CheeseBurger", "ChickenBurger", "ShrimpBurger"]
    let menuCost = [4500, 5000, 4700, 4800]
    
    @IBOutlet weak var BurgerCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 여기에서 원하는 셀의 크기를 지정합니다. 예를 들어, 가로 100, 세로 100으로 설정하겠습니다.
        return CGSize(width: 300, height: 250)
    }
    
    // 데이터가 몇개인지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // 데이터가 무엇인지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
        
//        let menuList = ["BulgogiBurger", "CheeseBurger", "ChickenBurger", "ShrimpBurger"]
        let currentMenu = menuList[indexPath.row]
        
        cell.setup(with: currentMenu, menuName: currentMenu)
        
        cell.MenuImage.contentMode = .scaleAspectFit
        
        cell.layer.cornerRadius = 8
        cell.backgroundColor = UIColor.init(cgColor: #colorLiteral(red: 1, green: 0.7779013515, blue: 0.4334530234, alpha: 0.8470588235))
        
        // 이미지뷰에 탭 제스처 추가
               let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(menuImageTapped))
               cell.MenuImage.addGestureRecognizer(tapGestureRecognizer)
               cell.MenuImage.isUserInteractionEnabled = true
        
        return cell
    }
    
    @objc func menuImageTapped(sender: UITapGestureRecognizer) {
           // 이미지를 누르면 "장바구니에 추가 하시겠습니까?" 다이얼로그를 띄우기
           let alert = UIAlertController(title: "장바구니에 추가", message: "장바구니에 추가 하시겠습니까?", preferredStyle: .alert)
           
           // 예 버튼 추가
           alert.addAction(UIAlertAction(title: "예", style: .default, handler: { action in
               self.addToCart() // 실제로 장바구니에 추가하는 로직을 호출하는 함수
           }))
           
           // 아니오 버튼 추가
           alert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
           
           // 다이얼로그 표시
           present(alert, animated: true, completion: nil)
       }
       
    func addToCart() {
        // 메인 뷰 컨트롤러에 메뉴 정보를 전달
     let selectedMenuIndex = BurgerCollectionView.indexPathsForSelectedItems?.first?.row ?? 0
     let selectedMenu = menuList[selectedMenuIndex]
     let selectedCost = menuCost[selectedMenuIndex]

            // 메인 뷰 컨트롤러에 메뉴 정보를 전달
         if let mainViewController = presentingViewController as? ViewController {
             let menu = Menu(name: selectedMenu, price: selectedCost, quantity: 1)
             mainViewController.updateCart(with: menu)
            }
        print("장바구니에 제품이 추가되었습니다.")
    }
    // 여기에 viewDidLoad 추가
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(#colorLiteral(red: 1, green: 0.6729137301, blue: 0.3843368888, alpha: 1))
        BurgerCollectionView?.delegate = self
        BurgerCollectionView?.dataSource = self
    }
}

