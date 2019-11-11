import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let lastUserID = UserDefaults.standard.string(forKey: "lastUser") {
            
            //Форсим потому что мы уверены что есть человек с таким ID
            let user = LocalDataManager.getUser(by: lastUserID)!
            
            let navController = Helper.getUserWallNavController()
            let viewController = navController.children.first as! PostsTableViewController
            
            viewController.user = user
            
            self.window?.rootViewController = navController
            
        } else {
            
            let viewController = Helper.getAuthorizationViewController()
            self.window?.rootViewController = viewController
        }
    }
}
