

import Foundation

class FileManagerHelp {
    
    func getFilePath() -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent("new.json")
        print("File path: \(path)")
        return path
    }
    
    func saveUser(data: [RegisterStruct]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        JSONEncoder().dateEncodingStrategy = .formatted(dateFormatter)
        do {
            let encodeData = try JSONEncoder().encode(data)
            try encodeData.write(to: getFilePath())
            print("User data saved successfully.")
        } catch {
            print("Failed to save user data: \(error.localizedDescription)")
        }
    }
    
    func updateMenuItemQuantity(item: MenuStruct, quantity: Int) {
        getUsers { users in
            var updatedUsers = users
            if let currentNumber = UserDefaults.standard.string(forKey: "currentNumber"),
               let userIndex = updatedUsers.firstIndex(where: { $0.number == currentNumber }) {
                if let itemIndex = updatedUsers[userIndex].orderList.firstIndex(where: { $0.orderName == item.orderName }) {
                    if quantity == 0 {
                        updatedUsers[userIndex].orderList.remove(at: itemIndex)
                    } else {
                        updatedUsers[userIndex].orderList[itemIndex].quantity = quantity
                    }
                    self.saveUser(data: updatedUsers)
                }
            }
        }
    }
    
    func getUsers(complete: @escaping ([RegisterStruct]) -> Void) {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        do {
            let data = try Data(contentsOf: getFilePath())
            let users = try decoder.decode([RegisterStruct].self, from: data)
            complete(users)
            print("User data retrieved successfully.")
        } catch {
            print("Failed to retrieve user data: \(error.localizedDescription)")
            complete([])
        }
    }
    
    func appendOrderToUser(order: MenuStruct, completion: @escaping () -> Void) {
        guard let currentNumber = UserDefaults.standard.string(forKey: "currentNumber") else {
            print("Не удалось найти текущий номер пользователя.")
            return
        }
        
        getUsers { users in
            var updatedUsers = users
            if let index = updatedUsers.firstIndex(where: { $0.number == currentNumber }) {
                updatedUsers[index].orderList.append(order)
                self.saveUser(data: updatedUsers)
                print("Заказ добавлен для пользователя \(currentNumber). Заказ: \(order)")
                completion()
            } else {
                print("User with number \(currentNumber) not found.")
            }
        }
    }
    
    func saveBasketForUser(userNumber: String, basket: [MenuStruct]) {
        getUsers { users in
            var updatedUsers = users
            if let index = updatedUsers.firstIndex(where: { $0.number == userNumber }) {
                updatedUsers[index].orderList = basket
                self.saveUser(data: updatedUsers)
                print("Basket saved for user \(userNumber).")
            } else {
                print("User with number \(userNumber) not found.")
            }
        }
    }
    
    func loadBasketForUser(userNumber: String, completion: @escaping ([MenuStruct]) -> Void) {
        getUsers { users in
            if let user = users.first(where: { $0.number == userNumber }) {
                completion(user.orderList)
                print("Basket loaded for user \(userNumber).")
            } else {
                completion([])
                print("User with number \(userNumber) not found.")
            }
        }
    }
    func appendCardToUser(card: CardStruct, completion: @escaping () -> Void) {
        guard let currentNumber = UserDefaults.standard.string(forKey: "currentNumber") else {
            print("Не удалось найти текущий номер пользователя.")
            return
        }
        
        getUsers { users in
            var updatedUsers = users
            if let index = updatedUsers.firstIndex(where: { $0.number == currentNumber }) {
                updatedUsers[index].cardInfo.append(card)
                self.saveUser(data: updatedUsers)
                print("Карта добавлена для пользователя \(currentNumber). Карта: \(card)")
                completion()
            } else {
                print("User with number \(currentNumber) not found.")
            }
        }
    }
    
    func getCardsForUser(userNumber: String, completion: @escaping ([CardStruct]) -> Void) {
        getUsers { users in
            if let user = users.first(where: { $0.number == userNumber }) {
                completion(user.cardInfo)
                print("Cards loaded for user \(userNumber).")
            } else {
                completion([])
                print("User with number \(userNumber) not found.")
            }
        }
    }
}


