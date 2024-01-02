//
//  SideViewController.swift
//  BURGER4JO
//
//  Created by 김우경 on 12/30/23.
//

import UIKit

class SideViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var SideCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 여기에서 원하는 셀의 크기를 지정합니다. 예를 들어, 가로 100, 세로 100으로 설정하겠습니다.
        return CGSize(width: 300, height: 250)
    }
    
    //데이터가 몇개 인지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    //데이터가 무엇인지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SideCollectionViewCell", for: indexPath) as! SideCollectionViewCell
        
        let SideList = ["CheeseBall", "CheeseStick", "BuffaloWings", "IceCream"]
        let currentSide = SideList[indexPath.row]
        
        cell.setup(with: currentSide, menuName: currentSide)
        
        cell.SideImage.contentMode = .scaleAspectFit
        
        cell.layer.cornerRadius = 8
        cell.backgroundColor = UIColor.init(cgColor: #colorLiteral(red: 1, green: 0.7779013515, blue: 0.4334530234, alpha: 0.8470588235))
        
        // 이미지뷰에 탭 제스처 추가
               let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SideImageTapped))
               cell.SideImage.addGestureRecognizer(tapGestureRecognizer)
               cell.SideImage.isUserInteractionEnabled = true
        
        return cell
    }
    // 이미지를 누르면 "장바구니에 추가 하시겠습니까?"
    @objc func SideImageTapped(sender: UITapGestureRecognizer) {
    
    
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
           // 여기에 실제로 장바구니에 추가하는 로직을 구현
           print("장바구니에 제품이 추가되었습니다.")
       }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(#colorLiteral(red: 1, green: 0.6729137301, blue: 0.3843368888, alpha: 1))
        SideCollectionView?.delegate = self
        SideCollectionView?.dataSource = self

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
