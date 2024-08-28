//
//  PaymentViewController.swift
//  FoodAppProject
//
//  Created by Chichek on 19.06.24.
//

import UIKit
import Lottie
class PaymentViewController: UIViewController{
    
    @IBOutlet weak var cardPicker: UIPickerView!
    
    @IBOutlet weak var cardDetails: UIButton!
    
    @IBOutlet weak var amount: UILabel!
    
    @IBOutlet weak var adress: UITextField!
    
    
    var viewModel = BasketViewController()
    var totalAmount: Double = 0.0
    
    var bankCards:[CardStruct] = []
    let fileManager = FileManagerHelp()
    let addNewCardOption = "Add new card"
    var currentUser: RegisterStruct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amount.text = "\(totalAmount)  azn"
        updateTotalPrice()
        cardPicker.delegate = self
        cardPicker.dataSource = self
        cardPicker.isHidden = true
        loadUserCards()
        if let currentNumber = UserDefaults.standard.string(forKey: "currentNumber") {
            fileManager.getCardsForUser(userNumber: currentNumber) { cards in
                self.bankCards = cards
                self.cardPicker.reloadAllComponents()
            }
        }
        
    }
    func addToBasket(card: CardStruct) {
        bankCards.append(card)
        saveCard()
    }
    private func saveCard() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(bankCards) {
            UserDefaults.standard.set(encoded, forKey: "cardItems")
        }
    }
    func loadUserCards() {
        if let currentNumber = UserDefaults.standard.string(forKey: "currentNumber") {
            fileManager.getCardsForUser(userNumber: currentNumber) { cards in
                self.currentUser?.cardInfo = cards
            }
        }
    }
    private func updateTotalPrice() {
        let basket = Basket.shared
        let total = basket.items.reduce(0) { (result, item) -> Double in
            return result + (Double(item.price) ?? 0.0)
        }
        amount.text = "Your order is \(total) AZN"
    }
    
    @IBAction func cardPickerAction(_ sender: Any) {
        cardPicker.isHidden = false
    }
    
    func presentAddNewCardDialog() {
        
        if let addCardVC = storyboard?.instantiateViewController(withIdentifier: "AddCardViewController") as? AddCardViewController {
            addCardVC.modalPresentationStyle = .formSheet
            addCardVC.completionHandler = { [weak self] newCard in
                self?.bankCards.append(newCard)
                self?.saveCard()
                self?.cardPicker.reloadAllComponents()
            }
            present(addCardVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func orderItAction(_ sender: Any) {
        let selectedRow = cardPicker.selectedRow(inComponent: 0)
        if selectedRow == bankCards.count || cardPicker.isHidden {
            let alert = UIAlertController(title: "No Card Selected", message: "Please select a card.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            Basket.shared.clearBasket()
            if let basketNavigator = self.storyboard?.instantiateViewController(withIdentifier: "FinalViewController") as? FinalViewController {
                self.navigationController?.pushViewController(basketNavigator, animated: true)
            }
            print("Payment controller")
        }
    }
}

extension PaymentViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedRow = cardPicker.selectedRow(inComponent: 0)
        if selectedRow < bankCards.count {
            let selectedCard = bankCards[selectedRow]
            print(selectedCard.cardName)
            
        } else {
            print(addNewCardOption)
            presentAddNewCardDialog()
        }
    }
    
}

extension PaymentViewController:UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bankCards.count + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row < bankCards.count {
            return bankCards[row].cardName
        } else {
            return addNewCardOption
        }
    }
}

