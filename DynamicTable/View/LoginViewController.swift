//
//  ViewController.swift
//  DynamicTable
//
//  Created by Ильдар Залялов on 09/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var vkLogoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let vkLogoCornerRadius: CGFloat = 10
    let wallSegueId = "showWallSegue"
    let incorrectCredentials = "Неверное имя пользователя или пароль"
    let emailValidationDidNotPass = "Вы ввели некорректный email"
    let passwordValidationDidNotPass = "Вы ввели некорректный пароль"
    let errorCaption = "Ошибка"
    let okButtonTitle = "OK"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated:true)
        
        passwordTextField.isSecureTextEntry = true
        vkLogoImageView.layer.cornerRadius = vkLogoCornerRadius
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        
        var errorText = ""
        
        if email.isValidEmail() {
            if password.isValidPassword() {
                if let _ = AuthManager.authenticate(email: email, password: password) {
                    performSegue(withIdentifier: wallSegueId, sender: self)
                }
                else {
                    errorText = incorrectCredentials
                }
            }
            else {
                errorText = passwordValidationDidNotPass
            }
        }
        else {
            errorText = emailValidationDidNotPass
        }
        
        if !errorText.isEmpty {
            
            let alertController = UIAlertController(title: errorCaption, message: errorText, preferredStyle: .alert)
            let action = UIAlertAction(title: okButtonTitle, style: .cancel)
            
            alertController.addAction(action)

            present(alertController, animated: true)
        }
    }
}

