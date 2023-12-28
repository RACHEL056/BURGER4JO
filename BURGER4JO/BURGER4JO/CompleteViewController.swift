//
//  CompleteViewController.swift
//  BURGER4JO
//
//  Created by 박민정 on 2023/12/28.
//

import Foundation
import UIKit

class CompleteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
    }


}
