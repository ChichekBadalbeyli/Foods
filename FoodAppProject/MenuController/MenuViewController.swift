//
//  MenuViewController.swift
//  FoodAppProject
//
//  Created by Chichek on 11.06.24.
//


import CoreData
import UIKit
import Foundation

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MenuTableViewCellDelegate {
    
    let fileManager = FileManagerHelp()
    var menuId: Int?
    @IBOutlet weak var menuTbaleView: UITableView!
    
    
    @IBOutlet weak var brandImage: UIImageView!
    
    @IBOutlet weak var brandName: UILabel!
    var selectedBrand: BrandsStruct?
    let viewModel = MenuModelViewController()
    let manager = FileManagerHelp()
    var currentUser: RegisterStruct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTbaleView.delegate = self
        menuTbaleView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(basketUpdated), name: NSNotification.Name("BasketUpdated"), object: nil)
        
        
        if let menuId = menuId {
            fetchBrandAndMenu(for: menuId)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(itemRemovedFromBasket(_:)), name: NSNotification.Name("BasketItemRemoved"), object: nil)
    }
    
    @objc func itemRemovedFromBasket(_ notification: Notification) {
        if let removedItem = notification.object as? MenuStruct {
            // Находим элемент в массиве меню и обновляем его количество
            if let index = viewModel.menu.firstIndex(where: { $0.orderName == removedItem.orderName }) {
                viewModel.menu[index].quantity -= 1
                // Обновляем отображение данных в таблице
                if let cell = menuTbaleView.cellForRow(at: IndexPath(row: index, section: 0)) as? MenuTableViewCell {
                    cell.addToBasketLabel.text = "\(viewModel.menu[index].quantity)"
                }
            }
        }
    }
 
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("BasketUpdated"), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("BasketItemRemoved"), object: nil)
    }
    
    @objc func basketUpdated() {
        print("MenuViewController received BasketUpdated notification - reloading table view")
        menuTbaleView.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        menuTbaleView.reloadData()
    }
    
    func fetchBrandAndMenu(for menuId: Int) {
        viewModel.fetchBrandAndMenu(for: menuId) { [weak self] in
            DispatchQueue.main.async {
                self?.updateUI()
                self?.menuTbaleView.reloadData()
            }
        }
    }
    
    func updateUI() {
        if let brandImageName = viewModel.selectedBrand?.brandImage {
            brandImage.image = UIImage(named: brandImageName)
        }
        brandImage.alpha = 0.6
        brandImage.layer.cornerRadius = 20
        brandName.text = viewModel.selectedBrand?.brandName
        brandName.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.menu.count
    }
    
    func getUsers() {
        manager.getUsers { users in
            let index = users.firstIndex(where: { $0.number == UserDefaults.standard.string(forKey: "currentNumber") })
            self.currentUser = users[index ?? 0]
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as? MenuTableViewCell else {
            return UITableViewCell()
        }
        let order = viewModel.menu[indexPath.row]
        cell.configure(with: order)
        cell.delegate = self
        return cell
    }
    
    func didAddToBasket(cell: MenuTableViewCell, order: MenuStruct) {
        if let indexPath = menuTbaleView.indexPath(for: cell) {
            viewModel.menu[indexPath.row] = order
            menuTbaleView.reloadRows(at: [indexPath], with: .none)
            NotificationCenter.default.post(name: NSNotification.Name("BasketUpdated"), object: nil)
        }
    }
    
    func didRemoveFromBasket(cell: MenuTableViewCell, order: MenuStruct) {
        if let indexPath = menuTbaleView.indexPath(for: cell) {
            viewModel.menu[indexPath.row] = order
            menuTbaleView.reloadRows(at: [indexPath], with: .none)
        }
    }
    
    
    
    
    @IBAction func infoActionButton(_ sender: Any) {
        if let selectedBrand = self.selectedBrand {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let restaurantInfoVC = storyboard.instantiateViewController(withIdentifier: "InfoViewController") as? InfoViewController {
                let infoStrings = selectedBrand.info.map { $0.info }
                restaurantInfoVC.restaurantInfo = infoStrings.joined(separator: "\n")
                restaurantInfoVC.restaurantName = selectedBrand.brandName
                present(restaurantInfoVC, animated: true, completion: nil)
            } else {
                print("Failed to instantiate InfoViewController")
            }
        } else {
            print("No selected brand")
        }
    }
    
    @IBAction func basketButtonAction(_ sender: Any) {
        if let basketNavigator = self.storyboard?.instantiateViewController(withIdentifier: "BasketViewController") as? BasketViewController {
            self.navigationController?.pushViewController(basketNavigator, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
