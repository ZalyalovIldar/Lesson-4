import UIKit
import RealmSwift

class LogInViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let realm = try! Realm()
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        
        let login = loginTextField.text!
        let password = passwordTextField.text!
        
        guard Helper.checkValidation(login: login, password: password) else {
            let button = sender as! customButton
            button.shake()
            Helper.presentErrorAlert(vc: self, message: "Incorrect Format")
            return
        }
        
        guard Helper.checkIsUserRegistered(login: login, password: password) else {
            let button = sender as! customButton
            button.shake()
            Helper.presentErrorAlert(vc: self, message: "User doesn't exist")
            return
        }
        
        let users = realm.objects(User.self)
        let user = users.first { (User) -> Bool in
            User.login == login && User.password == password
        }

        let userWallNavController = Helper.getUserWallNavController()
        let postsTableViewController = userWallNavController.children.first as! PostsTableViewController
        postsTableViewController.user = user
        
        UserDefaults.standard.set("\(user!.userID)", forKey: "lastUser")
        
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
