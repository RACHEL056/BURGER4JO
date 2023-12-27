//
//  BurgerViewController.swift
//  BURGER4JO
//
//  Created by 김우경 on 12/27/23.
//

import UIKit

class BurgerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
        
        let menuList = ["BulgogiBurger", "CheeseBurger", "ChickenBurger", "ShrimpBurger"]
        let currentMenu = menuList[indexPath.row]
        
        cell.setup(with: currentMenu, menuName: currentMenu)
        
        // cell.MenuImage.contentMode = .scaleAspectFit
            
        cell.MenuImage.contentMode = .scaleAspectFit

        cell.layer.cornerRadius = 8
        cell.backgroundColor = UIColor.init(cgColor: #colorLiteral(red: 1, green: 0.7779013515, blue: 0.4334530234, alpha: 0.8470588235))
        
        return cell
    }
    
    
    // 여기에 viewDidLoad 추가
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BurgerCollectionView.delegate = self
        BurgerCollectionView.dataSource = self
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

