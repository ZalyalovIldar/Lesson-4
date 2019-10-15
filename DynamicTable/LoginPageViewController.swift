//
//  LoginPageViewController.swift
//  DynamicTable
//
//  Created by Евгений on 13.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController, UITextFieldDelegate {
    
    let toProfileSegueIdentifier = "toProfile"
    let userUserDefaultsIdentifier = "user"
    let loggedUserToProfileSegue = "loggedUserToProfileSegue"
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userData = UserDefaults.standard.data(forKey: userUserDefaultsIdentifier),
            let user = try? JSONDecoder().decode(User.self, from: userData) {
            performSegue(withIdentifier: loggedUserToProfileSegue, sender: user)
        }
        passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        if (UserManager.isEmailValid(email: emailTextField.text ?? "") && (UserManager.isPasswordValid(password: passwordTextField.text ?? ""))) {
            
            let user = UserManager.getUser(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
            if let registeredUser = user {
                
                if let encoded = try? JSONEncoder().encode(registeredUser) {
                    UserDefaults.standard.set(encoded, forKey: userUserDefaultsIdentifier)
                }
                performSegue(withIdentifier: toProfileSegueIdentifier, sender: registeredUser)
                emailTextField.text = ""
                passwordTextField.text = ""
                emailTextField.endEditing(true)
                passwordTextField.endEditing(true)
            } else {loginError()}
        } else {loginError()}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == toProfileSegueIdentifier, let user = sender as? User {
            
            let destinationVC = segue.destination as? MainPageViewController
            destinationVC?.user = user
        }
        
        if segue.identifier == loggedUserToProfileSegue, let user = sender as? User {
            
            let destinationVC = segue.destination as? MainPageViewController
            destinationVC?.user = user
        }
    }
    
    func loginError() {
        
        let alert = UIAlertController(title: "Ошибка", message: "Данные введены неверно, попробуйте снова", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}
