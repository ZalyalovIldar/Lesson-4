import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        let signUpButton = sender as! customButton
        
        let login = loginTextField.text!
        let password = passwordTextField.text!
        
        guard LocalDataManager.checkValidation(login: login, password: password) else {
            
            signUpButton.shake()
            Helper.presentErrorAlert(vc: self, message: "Incorrect Format")
            return
        }
        
        let message = "Sign Up function in not ready yet"
        Helper.presentErrorAlert(vc: self, message: message)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
    }
}
