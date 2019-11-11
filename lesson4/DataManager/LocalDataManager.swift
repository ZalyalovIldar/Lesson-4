import Foundation

class LocalDataManager {
    
    private static var users = Generator.generateUsers()
    
    //MARK: - Working with users
    
    static func getAllUsers() -> [User] {
        return users
    }
    
    static func getUser(by login: String, password: String) -> User? {
        
        let user = users.first { (User) -> Bool in
            User.login == login && User.password == password
        }
        return user
    }
    
    static func getUser(by ID: String) -> User? {
        
        for user in users {
            if user.userID == ID { return user }
        }
        return nil
    }
    
    //MARK: - Working with posts
    
    static func changePost(with UUID: String, for newPost: Post) {
        
    }
    
    static func removePost(with UUID: String) {
        
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
        
        for user in users {
            if user.login == login && user.password == password { return true }
        }
        return false
    }
}
