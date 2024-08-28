//
//  HomeHeaderReusableView.swift
//  FoodAppProject
//
//  Created by Chichek on 05.06.24.
//

import UIKit
import CoreData

class HomeHeaderReusableView: UICollectionReusableView,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    var viewModel = HomeHeaderReusableModelView()
    
    @IBOutlet weak var cuisinsCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cuisinsCollection.dataSource = self
        cuisinsCollection.delegate = self
        cuisinsCollection.register(UINib(nibName: "\(HomeHeaderViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(HomeHeaderViewCell.self)")
        
        viewModel.fetchItemsCallBack = { [weak self] in
            self?.cuisinsCollection.reloadData()
        }
        viewModel.fetchCuisins()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.cuisinsType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeHeaderViewCell.self)", for: indexPath) as! HomeHeaderViewCell
        let cuisin = viewModel.cuisinsType[indexPath.item]
        cell.configure(with: UIImage(named: cuisin.cuisinsImage),
                       cuisinName: cuisin.cuisinsName)
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectedCuisin = indexPath
        let selectedCuisinId = viewModel.cuisinsType[indexPath.item].cuisinsTypeId
        viewModel.cuisinsIdCallback?(selectedCuisinId)
        cuisinsCollection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2
        let height = collectionView.frame.height / 2
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}

