//
//  DrinkCollectionViewCell.swift
//  BURGER4JO
//
//  Created by 김우경 on 12/30/23.
//

import UIKit

class DrinkCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var DrinkLabel: UILabel!
    @IBOutlet weak var DrinkImage: UIImageView!
    
    func setup(with imageName: String, menuName: String) {
        DrinkImage.image = UIImage(named: imageName)
        DrinkLabel.text = menuName
    }
}
