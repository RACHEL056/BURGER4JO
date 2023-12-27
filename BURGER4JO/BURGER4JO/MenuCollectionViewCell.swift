//
//  MenuCollectionViewCell.swift
//  BURGER4JO
//
//  Created by 김우경 on 12/28/23.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var MenuImage: UIImageView!
    @IBOutlet weak var MenuLabel: UILabel!
    
    func setup(with imageName: String, menuName: String) {
           MenuImage.image = UIImage(named: imageName)
           MenuLabel.text = menuName
    

       }
   }
