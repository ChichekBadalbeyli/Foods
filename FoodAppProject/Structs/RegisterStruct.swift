//
//  RegisterStruct.swift
//  FoodAppProject
//
//  Created by Chichek on 04.06.24.
//

import Foundation

struct RegisterStruct: Codable {
    
    var fullname: String
    var number: String
    var password: String
    var dateOfBirth: String
    var orderList: [MenuStruct]
    var cardInfo: [CardStruct]
    
}

