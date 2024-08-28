//
//  AddCardViewController.swift
//  FoodAppProject
//
//  Created by Chichek on 23.06.24.
//

import UIKit

class AddCardViewController: UIViewController {
    
    @IBOutlet weak var cardName: UITextField!
    
    @IBOutlet weak var cardNumber: UITextField!
    
    @IBOutlet weak var cvc: UITextField!
    
    var completionHandler: ((CardStruct) -> Void)?
    let fileManager = FileManagerHelp()
    var currentUser: RegisterStruct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Card"
        
        if let currentNumber = UserDefaults.standard.string(forKey: "currentNumber") {
            fileManager.getUsers { users in
                if let index = users.firstIndex(where: { $0.number == currentNumber }) {
                    
                }
            }
        }
    }
    
    @IBAction func addCardAction(_ sender: Any) {
        guard let cardNameText = cardName.text, !cardNameText.isEmpty,
              let cardNumberText = cardNumber.text, cardNumberText.count == 16,
              let cvcText = cvc.text, cvcText.count == 3 else {
            
            let alert = UIAlertController(title: "Error", message: "Please fill all the fields correctly.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
            return
        }
        let myCardInfo = CardStruct(cardName: cardNameText, expire: "", cardNumber: cardNumberText, cvc: cvcText, balance: 200)
        fileManager.appendCardToUser(card: myCardInfo) {
            print("Card appended to user.")
            self.completionHandler?(myCardInfo)
            self.dismiss(animated: true, completion: nil)
        }
    }
}



