//
//  BurgerViewController.swift
//  BURGER4JO
//
//  Created by 박민정 on 2023/12/29.
//

import Foundation
import UIKit

class BurgerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUILabel()
    }
    
    func setUILabel() {
        let label = UILabel()
        label.text = "버거 화면입니다"
        label.textAlignment = .center
        
        label.frame = CGRect(x: 150, y: 100, width: 100, height: 100)
        self.view.addSubview(label)
    }
}
