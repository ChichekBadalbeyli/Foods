//
//  CardStruct.swift
//  FoodAppProject
//
//  Created by Chichek on 29.06.24.
//

import Foundation
struct CardStruct: Codable {
    var cardName: String
    var expire: String
    var cardNumber: String
    var cvc: String
    var balance: Int
}
