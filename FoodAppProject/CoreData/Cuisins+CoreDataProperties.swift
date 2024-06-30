//
//  Cuisins+CoreDataProperties.swift
//  FoodAppProject
//
//  Created by Chichek on 04.06.24.
//
//

import Foundation
import CoreData


extension Cuisins {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cuisins> {
        return NSFetchRequest<Cuisins>(entityName: "Cuisins")
    }

    @NSManaged public var cuisinsImage: String?
    @NSManaged public var cuisinsName: String?
    @NSManaged public var cuisinsTypeId: Int64

}

extension Cuisins : Identifiable {

}
