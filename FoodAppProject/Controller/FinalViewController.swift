//
//  FinalViewController.swift
//  FoodAppProject
//
//  Created by Chichek on 25.06.24.
//

import UIKit
import Lottie

class FinalViewController: UIViewController {
    
    @IBOutlet weak var lottieView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lottieView.play()
        lottieView.loopMode = .loop
        setupCustomBackButton()
    }
    
    private func setupCustomBackButton() {
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(customBackAction))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func customBackAction() {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
