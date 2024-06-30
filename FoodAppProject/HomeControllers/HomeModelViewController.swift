//
//  HomeModelViewController.swift
//  FoodAppProject
//
//  Created by Chichek on 05.06.24.
//

import Foundation
import UIKit

class HomeModelViewController {
    
    var brands: [BrandsStruct] = []
    var filteredBrands: [BrandsStruct] = []
    var fetchItemsCallback: (()-> Void)?
    var filteredMenu: [BrandsStruct] = []
    
    func fetchItems() {
        let brandsData = MyBrands()
        brands = brandsData.brands
        filteredBrands = brands
        fetchItemsCallback?()
    }
    
    func filterBrands (forCuisinTypeId cuisinTypeId: Int) {
        filteredBrands = brands.filter { $0.cuisinesTypeId == cuisinTypeId
           
        }
        fetchItemsCallback?()
    }
    func filterMenu (for menuID: Int) {
        filteredMenu = brands.filter {$0.menuId==menuID}
        fetchItemsCallback?()
    }
    
}

