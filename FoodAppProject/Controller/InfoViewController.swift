//
//  InfoViewController.swift
//  FoodAppProject
//
//  Created by Chichek on 13.06.24.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    
    var restaurantInfo: String?
    var restaurantName: String?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            if let info = restaurantInfo, let name = restaurantName {
                infoLabel.text = info
                self.title = name
            }
            
        }

}
