//
//  BasketViewController.swift
//  FoodAppProject
//
//  Created by Chichek on 17.06.24.
//

import CoreData
import UIKit
import Foundation


class Basket {
    static let shared = Basket()
    
    private init() {}
    
    var items: [MenuStruct] = []
    let fileManager = FileManagerHelp()
    
    func addToBasket(item: MenuStruct) {
        if let existingItemIndex = items.firstIndex(where: { $0.orderName == item.orderName }) {
                   items[existingItemIndex].quantity += 1
               } else {
                   var newItem = item
                   newItem.quantity = 1
                   items.append(newItem)
               }
               saveBasket()
    }
    
    func clearBasket() {
        items.removeAll()
        saveBasket()
    }
    func removeFromBasket(item: MenuStruct, at index: Int) {
        if let existingItemIndex = items.firstIndex(where: { $0.orderName == item.orderName }) {
            if items[existingItemIndex].quantity > 0 {
                items[existingItemIndex].quantity -= 1
                if items[existingItemIndex].quantity == 0 {
                    items.remove(at: existingItemIndex)
                }
                saveBasket()
                NotificationCenter.default.post(name: NSNotification.Name("BasketUpdated"), object: nil) 
            }
        }
    }


    func saveBasket() {
        if let currentNumber = UserDefaults.standard.string(forKey: "currentNumber") {
            fileManager.saveBasketForUser(userNumber: currentNumber, basket: items)
        }
    }
    
    func loadBasket() {
        if let currentNumber = UserDefaults.standard.string(forKey: "currentNumber") {
            fileManager.loadBasketForUser(userNumber: currentNumber) { loadedItems in
                self.items = loadedItems
                NotificationCenter.default.post(name: NSNotification.Name("BasketUpdated"), object: nil)
            }
        }
    }
    
    func switchUser(to newUserNumber: String) {
        saveBasket()
        UserDefaults.standard.set(newUserNumber, forKey: "currentNumber")
        loadBasket()
    }
}

class BasketViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let fileManager = FileManagerHelp()
    
    @IBOutlet weak var totalPrice: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var removeItemCallback: ((Int) -> Void)?
    
    var viewModel = BasketViewModel()
    var currentNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(basketUpdated), name: NSNotification.Name("BasketUpdated"), object: nil)

                   if let userNumber = UserDefaults.standard.string(forKey: "currentNumber") {
                       Basket.shared.switchUser(to: userNumber)
                   }
                   updateTotalPrice()
                   tableView.reloadData()
    }


    @objc func basketUpdated() {
        print("Basket updated - reloading table view and updating total price")
        tableView.reloadData()
        updateTotalPrice()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Basket.shared.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BasketTableViewCell", for: indexPath) as! BasketTableViewCell
            let foodItem = Basket.shared.items[indexPath.row]
            cell.configure(with: foodItem)
            return cell
        }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let itemToRemove = Basket.shared.items[indexPath.row]
            Basket.shared.removeFromBasket(item: itemToRemove, at: indexPath.row)
            
            updateTotalPrice()
            NotificationCenter.default.post(name: NSNotification.Name("BasketItemRemoved"), object: itemToRemove)
        }
    }

    @IBAction func myBasketAction(_ sender: Any) {
        if Basket.shared.items.isEmpty {
            let alert = UIAlertController(title: "", message: "Your basket is empty", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController()
            let continueAction = UIAlertAction(title: "Continue", style: .default)
            let completeAction = UIAlertAction(title: "Complete my order", style: .default) { _ in
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
                self.navigationController?.pushViewController(controller, animated: true)
            }
            alert.addAction(continueAction)
            alert.addAction(completeAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    private func updateTotalPrice() {
        totalPrice.text = "\(viewModel.totalPrice) azn"
    }
}
