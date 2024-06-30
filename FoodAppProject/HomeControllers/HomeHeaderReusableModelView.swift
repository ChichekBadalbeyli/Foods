//
//  HomeHeaderReusableModelView.swift
//  FoodAppProject
//
//  Created by Chichek on 05.06.24.
//

import UIKit
import CoreData

class HomeHeaderReusableModelView: UICollectionReusableView {
    var cuisinsType: [CuisinsStruct] = []
    var selectedCuisin: IndexPath?
    var cuisinsIdCallback: ((Int)-> Void)?
    var fetchItemsCallBack: (()-> Void)?
    
    func fetchCuisins() {
        let cuisinData = MyCuisins()
        self.cuisinsType = cuisinData.cuisins
    }
}


