//
//  LoginViewController.swift
//  Homework
//
//  Created by Роман Шуркин on 18/10/2019.
//  Copyright © 2019 Роман Шуркин. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        let user = User.users.filter {
            $0.login == loginTextField.text && $0.password == passwordTextField.text
        }
      
        if loginTextField.text!.contains("@") && passwordTextField.text!.count >= 6 && !user.isEmpty {
            performSegue(withIdentifier: "login", sender: user[0])
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Неправильно введенные данные", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                
            }
            
            alert.addAction(alertAction)
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "login", let user = sender as? User {
            
            let destController = (segue.destination as! UINavigationController).topViewController as! ViewController
            
            destController.user = user
            
        }
    }
    
}
