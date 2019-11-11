import UIKit

class Helper {
    
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
    
    //MARK: - Present Error Alert
    
    static func presentErrorAlert(vc: UIViewController, message: String) {
        
        let errorAlert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        errorAlert.addAction(alertAction)
        
        vc.present(errorAlert, animated: true)
    }
}
