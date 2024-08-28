//
//  BasketTableViewCell.swift
//  FoodAppProject
//
//  Created by Chichek on 18.06.24.
//

import UIKit

class BasketTableViewCell: UITableViewCell {
    
    @IBOutlet private var orderImage: UIImageView!
    
    @IBOutlet private var orderName: UILabel!
    
    @IBOutlet private var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with item: MenuStruct) {
        orderImage.image = UIImage(named: item.orderImage)
        orderName.text = "X\(item.quantity) \(item.orderName)"
        price.text = "\(item.price) azn"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
