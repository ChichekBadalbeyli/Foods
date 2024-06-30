//
//  Brands+CoreDataProperties.swift
//  FoodAppProject
//
//  Created by Chichek on 04.06.24.
//
//

import Foundation
import CoreData


extension Brands {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Brands> {
        return NSFetchRequest<Brands>(entityName: "Brands")
    }

    @NSManaged public var brandImage: String?
    @NSManaged public var brandName: String?
    @NSManaged public var cuisinesTypeId: Int64
    @NSManaged public var typeId: Int64
    @NSManaged public var menuId: Int64

}

extension Brands : Identifiable {

}
