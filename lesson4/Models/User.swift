import Foundation
import UIKit

class User {
    
    var userID: String!
    var login: String!
    var password: String!

    var posts: [Post]?
    var status: String?
    var userPhoto: Data?
    var name: String?
    var shortInfo: String?
    var birthDay: String?
    var studiedAt: String?
}
