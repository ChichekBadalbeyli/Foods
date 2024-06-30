//
//  MenuStruct.swift
//  FoodAppProject
//
//  Created by Chichek on 04.06.24.
//

import Foundation
struct MenuStruct: Codable {
    var orderImage: String
    var orderName: String
    var menuId: Int
    var price: String
    var quantity: Int 
    
}

class MenuList {
    var menuList: [MenuStruct] = []
    init() {
      menuList = [
        MenuStruct(orderImage: "BigMackMeal", orderName: "Big Mack meal", menuId: 1, price: "13.95", quantity: 0),
        MenuStruct(orderImage: "McChiken", orderName: "McChicken meal", menuId: 1, price:"15", quantity: 0),
        MenuStruct(orderImage: "Royal", orderName: "Royal Cheeseburger meal", menuId: 1, price: "15", quantity: 0),
        MenuStruct(orderImage: "Fish", orderName: "Filet-o-Fish meal", menuId: 1, price: "15", quantity: 0),
        
        MenuStruct(orderImage: "Basket", orderName: "Basket Menu", menuId: 2, price: "15", quantity: 0),
        MenuStruct(orderImage: "Burger", orderName: "Burger Menu", menuId: 2, price: "15", quantity: 0),
        MenuStruct(orderImage: "Roll", orderName: "Roll Menu", menuId: 2, price: "15", quantity: 0),
        MenuStruct(orderImage: "Boxmaster", orderName: "Boxmaster Original", menuId: 2, price: "15", quantity: 0),
        
        MenuStruct(orderImage: "Anqus", orderName: "Anqus Parmezan Menu", menuId: 3, price: "15", quantity: 0),
        MenuStruct(orderImage: "Vuper", orderName: "Vooper Menu", menuId: 3, price: "15", quantity: 0),
        MenuStruct(orderImage: "King Basket", orderName: "King Basket", menuId: 3, price: "15", quantity: 0),
        MenuStruct(orderImage: "Kid", orderName: "Kid Menu", menuId: 3, price: "15", quantity: 0),
        
        MenuStruct(orderImage: "X", orderName: "X Burger", menuId: 4, price: "15", quantity: 0),
        MenuStruct(orderImage: "Chicken", orderName: "Chicken Burger", menuId: 4, price: "15", quantity: 0),
        MenuStruct(orderImage: "Monstr", orderName: "Monstr Burger", menuId: 4, price: "15", quantity: 0),
        MenuStruct(orderImage: "Zinger", orderName: "Zinger Burger", menuId: 4, price: "15", quantity: 0),
        
        MenuStruct(orderImage: "Chicken Pizza", orderName: "Chicken", menuId: 5, price: "15", quantity: 0),
        MenuStruct(orderImage: "Margarita", orderName: "Margarita", menuId: 5, price: "15", quantity: 0),
        MenuStruct(orderImage: "Pepperoni", orderName: "Pepperoni", menuId: 5, price: "15", quantity: 0),
        MenuStruct(orderImage: "Meksika", orderName: "Meksika", menuId: 5, price: "15", quantity: 0),
        
        MenuStruct(orderImage: "4", orderName: "4 Cheese", menuId: 6, price: "15", quantity: 0),
        MenuStruct(orderImage: "Supreme", orderName: "Supreme", menuId: 6, price: "15", quantity: 0),
        MenuStruct(orderImage: "Margherita", orderName: "Margherita", menuId: 6, price: "15", quantity: 0),
        MenuStruct(orderImage: "Veggie", orderName: "Veggie", menuId: 6, price: "15", quantity: 0),
        
        MenuStruct(orderImage: "BBQ", orderName: "Polo BBQ", menuId: 7, price: "15", quantity: 0),
        MenuStruct(orderImage: "Polo", orderName: "Polo", menuId: 7, price: "15", quantity: 0),
        MenuStruct(orderImage: "Peperoni", orderName: "Pepperoni", menuId: 7, price: "15", quantity: 0),
        MenuStruct(orderImage: "Mista", orderName: "Mista", menuId: 7, price: "15", quantity: 0),
        
        MenuStruct(orderImage: "Salami", orderName: "Salami", menuId: 8, price: "15", quantity: 0),
        MenuStruct(orderImage: "Pollo", orderName: "Funghi Con Pollo", menuId: 8, price: "15", quantity: 0),
        MenuStruct(orderImage: "Texas", orderName: "Texas", menuId: 8, price: "15", quantity: 0),
        MenuStruct(orderImage: "Volcano", orderName: "Volcano", menuId: 8, price: "15", quantity: 0),
        
        MenuStruct(orderImage: "Doner", orderName: "Doner", menuId: 9, price: "15", quantity: 0),
        MenuStruct(orderImage: "Lavash", orderName: "Doner lavash", menuId: 9, price: "15", quantity: 0),
        MenuStruct(orderImage: "1996", orderName: "Bakı 1996", menuId: 9, price: "15", quantity: 0),
        MenuStruct(orderImage: "Alman", orderName: "Alman", menuId: 9, price: "15", quantity: 0),
        
        MenuStruct(orderImage: "AlmanD", orderName: "Alman", menuId: 10, price: "15", quantity: 0),
        MenuStruct(orderImage: "Porsiyon", orderName: "Porsiyon", menuId: 10, price: "15", quantity: 0),
        MenuStruct(orderImage: "Top", orderName: "Top kimi", menuId: 10, price: "15", quantity: 0),
        MenuStruct(orderImage: "Plov", orderName: "Plov Ustu", menuId: 10, price: "15", quantity: 0),
        
        MenuStruct(orderImage: "Bread", orderName: "Shaurma (Bread)", menuId: 11, price: "15", quantity: 0),
        MenuStruct(orderImage: "LavashSh", orderName: "Shaurma (Lavash)", menuId: 11, price: "15", quantity: 0),
        MenuStruct(orderImage: "Mimoza", orderName: "Mimoza", menuId: 11, price: "15", quantity: 0),
        MenuStruct(orderImage: "Pide", orderName: "Pide", menuId: 11, price: "15", quantity: 0),
        
        MenuStruct(orderImage: "Zurna", orderName: "Zurna", menuId: 12, price: "15", quantity: 0),
        MenuStruct(orderImage: "Beyti", orderName: "Beyti", menuId: 12, price: "15", quantity: 0),
        MenuStruct(orderImage: "Chedar", orderName: "Çedarlı Peçat Dönər", menuId: 12, price: "15", quantity: 0),
        MenuStruct(orderImage: "Livan", orderName: "Livan Şaurması", menuId: 12, price: "15", quantity: 0),
        
        MenuStruct(orderImage: "Strawberry", orderName: "Strawberry", menuId: 13, price: "15", quantity: 0),
        MenuStruct(orderImage: "Ice", orderName: "Ice coffee", menuId: 13, price: "15", quantity: 0),
        MenuStruct(orderImage: "Cappuchino", orderName: "Cappuchino", menuId: 13, price: "15", quantity: 0),
        MenuStruct(orderImage: "Cappuchino", orderName: "Mocha", menuId: 13, price: "15", quantity: 0),
        
        MenuStruct(orderImage: "Coffee", orderName: "Cappuchino", menuId: 14, price: "15", quantity: 0),
        MenuStruct(orderImage: "Americano", orderName: "Americano", menuId: 14, price: "15", quantity: 0),
        MenuStruct(orderImage: "Coffee", orderName: "Latte", menuId: 14, price: "15", quantity: 0),
        MenuStruct(orderImage: "Coffee", orderName: "Mocha", menuId: 14, price: "15", quantity: 0),
        
        MenuStruct(orderImage: "Ice", orderName: "Ice coffee", menuId: 15, price: "15", quantity: 0),
        MenuStruct(orderImage: "Cappuchino", orderName: "Cappuchino", menuId: 15, price: "15", quantity: 0),
        MenuStruct(orderImage: "Americano", orderName: "Americano", menuId: 15, price: "15", quantity: 0),
        MenuStruct(orderImage: "Coffee", orderName: "Mocha", menuId: 15, price: "15", quantity: 0),
        
        MenuStruct(orderImage: "Ice", orderName: "Ice coffee", menuId: 16, price: "15", quantity: 0),
        MenuStruct(orderImage: "Cappuchino", orderName: "Cappuchino", menuId: 16, price: "15", quantity: 0),
        MenuStruct(orderImage: "Americano", orderName: "Americano", menuId: 16, price: "15", quantity: 0),
        MenuStruct(orderImage: "Coffee", orderName: "Mocha", menuId: 16, price: "15", quantity: 0)]
    }
    
}

