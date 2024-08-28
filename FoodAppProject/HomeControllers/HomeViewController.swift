//
//  HomeViewController.swift
//  FoodAppProject
//
//  Created by Chichek on 04.06.24.
//

import UIKit
import CoreData


class HomeViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    let userDefaults = UserDefaults.standard
    
    let viewModel = HomeModelViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.register(UINib(nibName: "\(HomeHeaderReusableView.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HomeHeaderReusableView.self)")
        
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        
        viewModel.fetchItemsCallback = { [weak self] in
            self?.homeCollectionView.reloadData()
        }
        viewModel.fetchItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(HomeHeaderReusableView.self)", for: indexPath) as! HomeHeaderReusableView
        headerView.viewModel.cuisinsIdCallback = { [weak self] cuisinId in
            self?.viewModel.filterBrands(forCuisinTypeId: cuisinId)
        }
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filteredBrands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        let brand = viewModel.filteredBrands[indexPath.item]
        cell.configure(with: UIImage(named: brand.brandImage ?? ""),
                       label: brand.brandName)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let brand = viewModel.filteredBrands[indexPath.item]
        openMenuViewController(with: brand.menuId)
    }
    
    func openMenuViewController(with menuId: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menuVC = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuVC.menuId = menuId
        navigationController?.pushViewController(menuVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 120, height: 120)
    }
    
    @IBAction func logOut(_ sender: Any) {
        
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.removeObject(forKey: "currentNumber")
        
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = scene.delegate as? SceneDelegate {
            sceneDelegate.setLoginAsRoot()
        }
    }
    
    @IBAction func basketAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "BasketViewController") as! BasketViewController
        navigationController?.pushViewController(controller, animated: true)
        Basket.shared.loadBasket()
    }
}
