import Foundation
import CoreData
import UIKit

class DataManagerFile {
    
    func saveBrands() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let managedContext = appDelegate.persistentContainer.viewContext
            let myBrandsClass = MyBrands()
            for brandsItem in myBrandsClass.brands {
                let entity = NSEntityDescription.entity(forEntityName: "Brands", in: managedContext)!
                let listObject = NSManagedObject(entity: entity, insertInto: managedContext)
                listObject.setValue(brandsItem.brandImage, forKeyPath: "brandImage")
                listObject.setValue(brandsItem.brandName, forKeyPath: "brandName")
                listObject.setValue(brandsItem.cuisinesTypeId, forKeyPath: "cuisinesTypeId")
                listObject.setValue(brandsItem.menuId, forKeyPath: "menuId")
            }
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
    func saveCuisins() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let managedContext = appDelegate.persistentContainer.viewContext
            let myCuisinsClass = MyCuisins()
            
            for cuisinsItem in myCuisinsClass.cuisins {
                let entity = NSEntityDescription.entity(forEntityName: "Cuisins", in: managedContext)!
                let listObject = NSManagedObject(entity: entity, insertInto: managedContext)
                
                listObject.setValue(cuisinsItem.cuisinsImage, forKeyPath: "cuisinsImage")
                listObject.setValue(cuisinsItem.cuisinsName, forKeyPath: "cuisinsName")
                listObject.setValue(cuisinsItem.cuisinsTypeId, forKeyPath: "cuisinsTypeId")
            }
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
}

