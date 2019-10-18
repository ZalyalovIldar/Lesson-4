//
//  ViewController.swift
//  DynamicTable
//
//  Created by Ильдар Залялов on 09/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var textFields: [UITextField] = []
    
//    var userModel: User!
    
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                      NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 17)!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: true)
        
        textFields.append(loginTextField)
        textFields.append(passwordTextField)
        
        setupUI()
    }
    
    private func setupUI() {
        
        loginTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        passwordTextField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        
        for textField in textFields {
            
            textField.clipsToBounds = true
            textField.layer.cornerRadius = 8
            
            let placeholderPadding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
            
            textField.leftView = placeholderPadding
            textField.leftViewMode = UITextField.ViewMode.always
        }
        
        loginTextField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                                  attributes: attributes)
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Пароль",
                                                                     attributes: attributes)
    }
    
    func showWarningAlert(message: String) {
        
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Понял, принял, осознал", style: .destructive, handler: nil)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        guard let email = loginTextField.text, let password = passwordTextField.text else { return }
        
        if DataValidator.validateEmail(email: email) {
            if  !DataValidator.validatePassword(with: password) {
                showWarningAlert(message: "Пароль должен состоять из букв и цифр и содержать минимум 6 символов")
                return
            }
        } else {
            showWarningAlert(message: "Email не найден")
            return
        }
        
        if DataValidator.validateEmail(email: email) &&  DataValidator.validatePassword(with: password) {
            guard let _ = UsersProvider.auth(email: email, password: password) else  {
                showWarningAlert(message: "Пользователь не найден")
                return
            }
            performSegue(withIdentifier: Constants.loginSegueId, sender: self)
        }
        
        loginTextField.text = nil
        passwordTextField.text = nil
    }
}
