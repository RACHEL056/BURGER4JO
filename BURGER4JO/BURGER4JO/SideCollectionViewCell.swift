//
//  SideCollectionViewCell.swift
//  BURGER4JO
//
//  Created by 김우경 on 12/30/23.
//

import UIKit

class SideCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var SideImage: UIImageView!
    @IBOutlet weak var SideLabel: UILabel!
    
    func setup(with imageName: String, menuName: String) {
        SideImage.image = UIImage(named: imageName)
        SideLabel.text = menuName
    }
}
