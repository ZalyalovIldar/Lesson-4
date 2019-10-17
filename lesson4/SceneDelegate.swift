import UIKit
import RealmSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let realm = try! Realm()
    var isAuthorized: String!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
        
        isAuthorized = UserDefaults.standard.string(forKey: "lastUser")

        if UserDefaults.standard.string(forKey: "isFirstLaunch") == nil {
            
            let users = Generator.generateUsers()
            try! realm.write {
                realm.add(users)
            }
            UserDefaults.standard.set("firstLaunch", forKey: "isFirstLaunch")
        }
        
        if let userID = UserDefaults.standard.string(forKey: "lastUser") {
            
            let user = Helper.getUserByID(ID: userID)!
            
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
