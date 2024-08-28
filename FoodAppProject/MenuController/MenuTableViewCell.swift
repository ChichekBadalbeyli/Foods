//
//  MenuTableViewCell.swift
//  FoodAppProject
//
//  Created by Chichek on 11.06.24.
//

import UIKit
protocol MenuTableViewCellDelegate: AnyObject {
    func didAddToBasket(cell: MenuTableViewCell, order: MenuStruct)
    func didRemoveFromBasket(cell: MenuTableViewCell, order: MenuStruct)
}
class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet private var orderImage: UIImageView!
    
    @IBOutlet weak var orderName: UILabel!
    
    @IBOutlet weak var insertButton: UIButton!
    
    @IBOutlet private var priceLabel: UILabel!
    
    @IBOutlet weak var addToBasketLabel: UILabel!
    
    @IBOutlet weak var removeButton: UIButton!
    
    weak var delegate: MenuTableViewCellDelegate?
    
    var addToBasketCallback: ((Int, MenuStruct) -> Void)?
    var removeButtonCallBack: ((MenuStruct) -> Void)?
    
    var order: MenuStruct? {
        didSet {
            if let order = order {
                addToBasketLabel.text = "\(order.quantity)"
                print("Updated")
            }
        }
    }
    
    func configure(with order: MenuStruct) {
        self.orderImage.image = UIImage(named: order.orderImage)
        self.orderName.text = order.orderName
        self.priceLabel.text = "\(order.price) azn"
        self.addToBasketLabel.text = "\(order.quantity)"
        self.order = order
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        orderImage.translatesAutoresizingMaskIntoConstraints = false
        orderName.translatesAutoresizingMaskIntoConstraints = false
        insertButton.translatesAutoresizingMaskIntoConstraints = false
        addToBasketLabel.translatesAutoresizingMaskIntoConstraints = false
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            orderImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            orderImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            orderImage.widthAnchor.constraint(equalToConstant: 60),
            orderImage.heightAnchor.constraint(equalToConstant: 60),
            
            orderName.leadingAnchor.constraint(equalTo: orderImage.trailingAnchor, constant: 8),
            orderName.trailingAnchor.constraint(lessThanOrEqualTo: insertButton.leadingAnchor, constant: -8),
            orderName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            insertButton.trailingAnchor.constraint(equalTo: addToBasketLabel.leadingAnchor, constant: -8),
            insertButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            insertButton.widthAnchor.constraint(equalToConstant: 35),
            insertButton.heightAnchor.constraint(equalToConstant: 35),
            
            addToBasketLabel.trailingAnchor.constraint(equalTo: removeButton.leadingAnchor, constant: -8),
            addToBasketLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            removeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            removeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            removeButton.widthAnchor.constraint(equalToConstant: 35),
            removeButton.heightAnchor.constraint(equalToConstant: 35),
            
            priceLabel.leadingAnchor.constraint(equalTo: orderImage.trailingAnchor, constant: 8),
            priceLabel.topAnchor.constraint(equalTo: orderName.bottomAnchor, constant: 4),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    
    
    @IBAction func insertButtonAction(_ sender: Any) {
        guard var order = order else { return }
        order.quantity += 1
        self.order = order
        delegate?.didAddToBasket(cell: self, order: order)
        print("Inserted: \(order.orderName) quantity is now \(order.quantity)")
        Basket.shared.addToBasket(item: order)
    }
    
    @IBAction func removeButtonAction(_ sender: Any) {
        guard var order = order else { return }
        if order.quantity > 0 {
            order.quantity -= 1
            self.order = order
            delegate?.didRemoveFromBasket(cell: self, order: order)
            Basket.shared.removeFromBasket(item: order, at: 0)
            print("Removed: \(order.orderName) quantity is now \(order.quantity)")
        }
    }
}
