//
//  SearchViewController.swift
//  FoodAppProject
//
//  Created by Chichek on 10.06.24.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UISearchBarDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var searchCollection: UICollectionView!
    @IBOutlet weak var mySearchAction: UISearchBar!
    
    
    var searchController: UISearchController!
    
    let viewModel = SearchModelViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupViewModel()
        setupSearchController()
        viewModel.fetchItems()
    }
    
    private func setupCollectionView() {
        searchCollection.delegate = self
        searchCollection.dataSource = self
    }
    
    private func setupViewModel() {
        viewModel.fetchItemsCallback = { [weak self] in
            self?.searchCollection.reloadData()
        }
    }
    
    private func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Foods"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func isSearchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        if isSearchBarEmpty() {
            viewModel.filteredMenu = viewModel.menu
        } else {
            viewModel.filteredMenu = viewModel.menu.filter { $0.orderName.lowercased().contains(searchText.lowercased()) }
        }
        viewModel.fetchItemsCallback?()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filteredMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        let food = viewModel.filteredMenu[indexPath.item]
        cell.brandImage.image = UIImage(named: food.orderImage)
        cell.brandName.text = food.orderName
        cell.layer.cornerRadius = 40
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = viewModel.filteredMenu[indexPath.item]
        openMenuController(with: food.menuId)
    }
    
    func openMenuController(with menuId: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menuVC = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuVC.menuId = menuId
        navigationController?.pushViewController(menuVC, animated: true)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text ?? "")
    }
}


