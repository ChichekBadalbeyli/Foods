//
//  Info+CoreDataProperties.swift
//  FoodAppProject
//
//  Created by Chichek on 05.06.24.
//
//

import Foundation
import CoreData


extension Info {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Info> {
        return NSFetchRequest<Info>(entityName: "Info")
    }

    @NSManaged public var info: String?
   // @NSManaged public var infoId: Int64
    @NSManaged public var image: String?

}

extension Info : Identifiable {

}
