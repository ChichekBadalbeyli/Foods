

import Foundation

class MenuModelViewController {
    
    var menuId: Int?
    var menu: [MenuStruct] = []
    var brands: [BrandsStruct] = []
    var selectedBrand: BrandsStruct?
    
    func fetchBrandAndMenu(for menuId: Int, completion: @escaping () -> Void) {
        let myBrands = MyBrands()
        let menuData = MenuList().menuList
        
        brands = myBrands.brands
        menu = menuData.filter { $0.menuId == menuId }
        
        if let selectedBrand = brands.first(where: { $0.menuId == menuId }) {
            self.selectedBrand = selectedBrand
        }
        
        completion()
    }
}
