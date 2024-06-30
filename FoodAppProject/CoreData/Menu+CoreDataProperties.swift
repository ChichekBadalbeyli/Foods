//
//  Menu+CoreDataProperties.swift
//  FoodAppProject
//
//  Created by Chichek on 05.06.24.
//
//

import Foundation
import CoreData


extension Menu {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Menu> {
        return NSFetchRequest<Menu>(entityName: "Menu")
    }

    @NSManaged public var orderImage: String?
    @NSManaged public var orderName: String?
    @NSManaged public var menuId: Int64
 
}

extension Menu : Identifiable {

}
