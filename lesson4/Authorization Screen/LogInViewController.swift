import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        
        let login = loginTextField.text!
        let password = passwordTextField.text!
        
        guard LocalDataManager.checkValidation(login: login, password: password) else {
            let button = sender as! customButton
            button.shake()
            Helper.presentErrorAlert(vc: self, message: "Incorrect Format")
            return
        }
        
        guard LocalDataManager.checkIsUserRegistered(login: login, password: password) else {
            let button = sender as! customButton
            button.shake()
            Helper.presentErrorAlert(vc: self, message: "User doesn't exist")
            return
        }
        
        //Форсим потому что мы уже уверены что есть пользователь с таким логином и паролем
        let user = LocalDataManager.getUser(by: login, password: password)!

        let userWallNavController = Helper.getUserWallNavController()
        let postsTableViewController = userWallNavController.children.first as! PostsTableViewController
        postsTableViewController.user = user
        
        UserDefaults.standard.set(user.userID, forKey: "lastUser")
        
        UIApplication.setRootView(userWallNavController)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
    }
}
