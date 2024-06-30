//
//  CuisinsStruct.swift
//  FoodAppProject
//
//  Created by Chichek on 04.06.24.
//

import Foundation

struct CuisinsStruct {
    var cuisinsImage: String
    var cuisinsName: String
    var cuisinsTypeId: Int
}
class MyCuisins {
    var cuisins: [CuisinsStruct] = []
    
    init () {
       cuisins = [ CuisinsStruct(cuisinsImage: "FastFood", cuisinsName: "Burger", cuisinsTypeId: 1),
                   CuisinsStruct(cuisinsImage: "Pizza", cuisinsName: "Pizza", cuisinsTypeId: 2),
                   CuisinsStruct(cuisinsImage: "Doner", cuisinsName: "Doner", cuisinsTypeId: 3),
                   CuisinsStruct(cuisinsImage: "Coffe", cuisinsName: "Coffee", cuisinsTypeId: 4),]
    }
}

