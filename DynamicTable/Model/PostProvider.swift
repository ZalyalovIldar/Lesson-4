//
//  PostProvider.swift
//  DynamicTable
//
//  Created by Enoxus on 11/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import Foundation

class PostProvider {
    
    private static let email1 = "email1@gmail.com"
    private static let email2 = "email2@gmail.com"
    private static let email3 = "email3@gmail.com"
    
    class func getPosts(of user: User) -> [Post] {
        var posts = [Post]()
        
        switch user.email {
        case email1:
            
            posts.append(Post(text: "Short text without an image", imageName: nil))
            posts.append(Post(text: "relatable", imageName: "pic1"))
            posts.append(Post(text: "Switzerland’s secret weapon Breakdown Of Sanity is slowly emerging as a solid entity in the metal world, capable of delivering some of the most mighty and original modern metal. This band’s metalcore assault is simply lethal, achieving the perfection that every modern metalcore band aims for nowadays. “Perception” is a massive release and Breakdown of Sanity is a band you must discover this year. They truly deserve wider recognition in the surrounding sea of generic breakdown bands", imageName: "perception"))
        case email2:
            
            posts.append(Post(text: nil, imageName: "pic2"))
            posts.append(Post(text: "doot", imageName: "pic3"))
            posts.append(Post(text: "bruh", imageName: "pic5"))
        case email3:
            
            posts.append(Post(text: nil, imageName: "pic6"))
            posts.append(Post(text: "epic", imageName: "pic8"))
            posts.append(Post(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", imageName: nil))
        default:
            posts = []
        }
        
        return posts
    }
}
