import RealmSwift
import UIKit

class Helper {
    
    private static let realm = try! Realm()
    
    //MARK: - Controllers getter
    
    static func getUserWallNavController() -> UINavigationController {
        
        let storyboard = UIStoryboard(name: "UserWall", bundle: nil)
        let navController = storyboard.instantiateInitialViewController() as! UINavigationController
        return navController
    }
    
    static func getAuthorizationViewController() -> AuthorizationViewController {
        
        let storyboard = UIStoryboard(name: "Authorization", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! AuthorizationViewController
        return viewController
    }
    
    //MARK: - Check validation && user existence
    
    static func checkValidation(login: String, password: String) -> Bool {
        
        if !login.contains("@") { return false }
        if password.count < 6 { return false }
        
        let digits: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        for letter in password {
            if digits.contains(letter) { return true }
        }
        return false
    }
    
    static func checkIsUserRegistered(login: String, password: String) -> Bool {
        
        let users = realm.objects(User.self)
        
        for user in users {
            if user.login == login && user.password == password { return true }
        }
        return false
    }
    
    //MARK: - Realm
    
    static func getUserByID(ID: String) -> User? {
        
        let users = realm.objects(User.self)
        
        for user in users {
            if user.userID == ID { return user }
        }
        return nil
    }
    
    //MARK: - Present Error Alert
    
    static func presentErrorAlert(vc: UIViewController, message: String) {
        
        let errorAlert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        errorAlert.addAction(alertAction)
        
        vc.present(errorAlert, animated: true)
    }
}
