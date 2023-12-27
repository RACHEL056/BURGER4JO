//
//  BurgerViewController.swift
//  BURGER4JO
//
//  Created by 김우경 on 12/27/23.
//

import UIKit

class BurgerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // 데이터가 몇개인지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    // 데이터가 무엇인지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
        
        cell.MenuLabel.text = ["BulgogiBurger", "CheeseBurger", "ChickenBurger", "ShrimpBurger"].joined(separator: ", ")

        
        cell.layer.cornerRadius = 8
        cell.backgroundColor = UIColor.init(cgColor: #colorLiteral(red: 1, green: 0.7779013515, blue: 0.4334530234, alpha: 0.8470588235))


        return cell
    }
    
    @IBOutlet weak var BurgerCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BurgerCollectionView.delegate = self
        BurgerCollectionView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
