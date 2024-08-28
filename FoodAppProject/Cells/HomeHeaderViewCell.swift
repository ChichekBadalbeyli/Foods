//
//  HomeHeaderViewCell.swift
//  FoodAppProject
//
//  Created by Chichek on 05.06.24.
//

import UIKit

class HomeHeaderViewCell: UICollectionViewCell {
    
    
    @IBOutlet private var cuisinsLabel: UILabel!
    
    @IBOutlet private var cuisinsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cuisinsImage.contentMode = .scaleAspectFill
        cuisinsImage.clipsToBounds = true
        cuisinsImage.layer.cornerRadius = 20
        cuisinsImage.layer.masksToBounds = true
    }
    
    func configure(with cuisinImage: UIImage?, cuisinName: String?) {
        cuisinsImage.image = cuisinImage
        cuisinsLabel.text = cuisinName
    }
    
}
