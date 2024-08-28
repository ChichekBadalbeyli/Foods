//
//  LogInController.swift
//  FoodAppProject
//
//  Created by Chichek on 02.06.24.
//

import UIKit
import Lottie

class LogInController: UIViewController {
    
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var lottieView: LottieAnimationView!
    
    let userDefaults = UserDefaults.standard
    
    var users: [RegisterStruct] = []
    
    let manager = FileManagerHelp()
    
    var myLogin: LoginStruct?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lottieView.play()
        lottieView.loopMode = .loop
        manager.getUsers { users in
            self.users = users
        }
        
    }
    
    @IBAction func signInButton(_ sender: Any) {
        if let mobile = mobileNumberTextField.text, let password = passwordTextField.text {
            if users.first(where: { $0.number == mobile && $0.password == password }) != nil {
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                UserDefaults.standard.set(mobile, forKey: "currentNumber")
                switchToHome()
            }
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        navigationController?.show(controller, sender: nil)
        controller.callback = { user in
            self.myLogin = LoginStruct(password: user.password, mobile: user.number)
            self.mobileNumberTextField.text = user.number
            self.passwordTextField.text = user.password
            self.users.append(user)
            self.manager.saveUser(data:self.users)
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func switchToHome() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = scene.delegate as? SceneDelegate {
            sceneDelegate.setHomeAsRoot()
        }
    }
}

