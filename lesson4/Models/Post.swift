import Foundation
import UIKit

class Post {
    
    var postID = UUID().uuidString
    var postDate: Date?
    var image: Data?
    var text: String?
}
