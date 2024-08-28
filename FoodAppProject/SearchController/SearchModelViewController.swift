//
//  SearchModelViewController.swift
//  FoodAppProject
//
//  Created by Chichek on 21.06.24.
//

import UIKit

class SearchModelViewController {
    var menu: [MenuStruct] = []
    var filteredMenu: [MenuStruct] = []
    var fetchItemsCallback: (() -> Void)?

    func fetchItems() {
        let foodData = MenuList()
        menu = foodData.menuList
        filteredMenu = menu 
        fetchItemsCallback?()
    }
}
