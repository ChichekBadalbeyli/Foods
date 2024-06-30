

import Foundation
import UIKit

class BasketViewModel {
    let fileManager = FileManagerHelp()
    var items: [MenuStruct] {
        return Basket.shared.items
    }
    
    var totalPrice: Double {
        return items.reduce(0.0) { (result, item) -> Double in
            let itemTotal = Double(item.quantity) * (Double(item.price) ?? 0.0)
            return result + itemTotal
        }
    }
    
    func loadBasket(for userNumber: String?) {
        if let userNumber = userNumber {
            Basket.shared.switchUser(to: userNumber)
        }
    }
    
    func removeItem(at index: Int, completion: @escaping () -> Void) {
           guard index < items.count else {
               return
           }
           
           let itemToRemove = items[index]
           
           Basket.shared.removeFromBasket(item: itemToRemove, at: index)
           
           fileManager.getUsers { users in
               var updatedUsers = users
               if let currentNumber = UserDefaults.standard.string(forKey: "currentNumber"),
                  let userIndex = updatedUsers.firstIndex(where: { $0.number == currentNumber }) {
                   updatedUsers[userIndex].orderList = Basket.shared.items
                   self.fileManager.saveUser(data: updatedUsers)
                   completion()
               }
           }
       }
}
