//
//  RegisterController.swift
//  FoodAppProject
//
//  Created by Chichek on 03.06.24.
//

import UIKit

class RegisterController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    
    
    var callback: ((RegisterStruct) -> Void)?
    let manager = FileManagerHelp()
    var users = [RegisterStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpActionButton(_ sender: Any) {
        let myRegisterInfo = RegisterStruct (fullname: nameTextField.text ?? "", number: mobileNumberTextField.text ?? "", password: passwordTextField.text ?? "", dateOfBirth: dateOfBirth.text ?? "", orderList:[], cardInfo: [])
        users.append(myRegisterInfo)
        manager.saveUser(data: self.users)
        callback?(myRegisterInfo)
        let controller = storyboard?.instantiateViewController(withIdentifier: "LogInController") as! LogInController
        navigationController?.show(controller, sender: nil)
    }
    
    
}
