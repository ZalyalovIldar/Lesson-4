//
//  LoginViewController.swift
//  VK
//
//  Created by Азат Султанов on 14.10.2019.
//  Copyright © 2019 Прокопьев Павел. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var logs = LoginsAndPasswords()
    let mainIdentifier = "mainIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        
    }
    

    @IBAction func loginButton(_ sender: Any) {
        let errorAlert = UIAlertController(title: "Error", message: "Неправильный логин или пароль", preferredStyle: .alert)
        let emailAlert = UIAlertController(title: "Error", message: "Почта введена неправильно", preferredStyle: .alert)
        let cancelError = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        errorAlert.addAction(cancelError)
        emailAlert.addAction(cancelError)
        guard isValidEmail(email: emailTextField.text) else {
            self.present(emailAlert, animated: true, completion: nil)
            return
        }
        if logs.checkValid(email: emailTextField.text!, password: passwordTextField.text!) == true {
            self.performSegue(withIdentifier: mainIdentifier, sender: emailTextField.text)
        }
        else{
            self.present(errorAlert, animated: true, completion: nil)
        }
    }
    
    func isValidEmail(email: String?) -> Bool {
        guard email != nil else {
            return false
        }
        let regex = try! NSRegularExpression(pattern: "@.*\\.com")
        let nsString = email! as NSString
        let results = regex.matches(in: email!, range: NSRange(location: 0, length: nsString.length))
        if results.count == 0 {
            return false
        }
        else {
            return true
        }
    }
}
