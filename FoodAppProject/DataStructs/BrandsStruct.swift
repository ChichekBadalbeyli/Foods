//
//  BrandsStruct.swift
//  FoodAppProject
//
//  Created by Chichek on 04.06.24.
//

import Foundation
struct BrandsStruct {
    var brandImage: String?
    var brandName: String
    var cuisinesTypeId: Int
    var info: [InfoStruct]
    var menuId: Int
}
struct InfoStruct {
    var info: String
}

class MyBrands {
    var brands: [BrandsStruct] = []
    
    init() {
        brands = [
            BrandsStruct(brandImage: "MC", brandName: "McDonald's", cuisinesTypeId: 1, info: [.init(info: "McDonald's is a global fast food chain known for its burgers, fries, and other quick service meals.")], menuId: 1),
            BrandsStruct(brandImage: "KFC", brandName: "KFC", cuisinesTypeId: 1, info: [.init(info: "KFC, short for Kentucky Fried Chicken, specializes in fried chicken and related fast food.")], menuId: 2),
            BrandsStruct(brandImage: "BurgerKing", brandName: "Burger King", cuisinesTypeId: 1, info: [.init(info: "Burger King is an American multinational chain of hamburger fast food restaurants.")], menuId: 3),
            BrandsStruct(brandImage: "Fryday", brandName: "Fryday", cuisinesTypeId: 1, info: [.init(info: "Fryday offers a variety of fried fast food items including burgers and fries.")], menuId: 4),
            
            BrandsStruct(brandImage: "PapaJohns", brandName: "Papa John's", cuisinesTypeId: 2, info: [.init(info: "Papa John's is a pizza delivery and take-out restaurant chain offering a variety of pizzas and sides.")], menuId: 5),
            BrandsStruct(brandImage: "Dominos", brandName: "Domino's", cuisinesTypeId: 2, info: [.init(info: "Domino's is a pizza restaurant chain that also offers pasta, chicken, and sandwiches.")], menuId: 6),
            BrandsStruct(brandImage: "ByRuslan", brandName: "By Ruslan", cuisinesTypeId: 2, info: [.init(info: "By Ruslan is known for its handcrafted pizzas and unique toppings.")], menuId: 7),
            BrandsStruct(brandImage: "PizzaMizza", brandName: "Pizza Mizza", cuisinesTypeId: 2, info: [.init(info: "Pizza Mizza offers a wide range of pizzas with a focus on fresh ingredients and traditional recipes.")], menuId: 8),
            
            BrandsStruct(brandImage: "BirIki", brandName: "Bir Iki", cuisinesTypeId: 3, info: [.init(info: "Bir Iki serves a variety of Turkish-style döner and other Middle Eastern fast food.")], menuId: 9),
            BrandsStruct(brandImage: "Ajdaha", brandName: "Ajdaha", cuisinesTypeId: 3, info: [.init(info: "Ajdaha offers authentic Turkish cuisine including kebabs and other grilled dishes.")], menuId: 10),
            BrandsStruct(brandImage: "Shaurma", brandName: "Shaurma №1", cuisinesTypeId: 3, info: [.init(info: "Shaurma №1 specializes in shawarma and other Middle Eastern fast food options.")], menuId: 11),
            BrandsStruct(brandImage: "Pechat", brandName: "Pechat", cuisinesTypeId: 3, info: [.init(info: "Pechat provides a variety of kebabs and traditional Middle Eastern dishes.")], menuId: 12),
            
            BrandsStruct(brandImage: "Star", brandName: "Starbucks", cuisinesTypeId: 4, info: [.init(info: "Starbucks is a global coffeehouse chain known for its specialty coffees, teas, and pastries.")], menuId: 13),
            BrandsStruct(brandImage: "TheBagel", brandName: "The Bagel", cuisinesTypeId: 4, info: [.init(info: "The Bagel offers a wide selection of bagels, spreads, and coffee.")], menuId: 14),
            BrandsStruct(brandImage: "SecondCup", brandName: "Second Cup", cuisinesTypeId: 4, info: [.init(info: "Second Cup is a coffee retailer offering a variety of coffees, teas, and light meals.")], menuId: 15),
            BrandsStruct(brandImage: "Gloria", brandName: "Gloria Jeans", cuisinesTypeId: 4, info: [.init(info: "Gloria Jeans Coffees is an Australian-based coffeehouse chain known for its specialty coffees and beverages.")], menuId: 16)
        ]
    }
}

