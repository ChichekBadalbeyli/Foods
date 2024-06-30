//
//  BrandsCollectionViewCell.swift
//  FoodAppProject
//
//  Created by Chichek on 05.06.24.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var brandImage: UIImageView!
    
    override func awakeFromNib() {
            super.awakeFromNib()
        brandImage.contentMode = .scaleAspectFill
             brandImage.clipsToBounds = true
             brandImage.layer.cornerRadius = 20
        }
    
    func configure(with image: UIImage?, label: String?) {
        brandImage.image = image
    }
    
    
}
