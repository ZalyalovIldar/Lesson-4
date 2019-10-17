//
//  PostsProvider.swift
//  DynamicTable
//
//  Created by Amir on 17.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

enum Emails: String {
    case email1 = "mail1@mail.ru"
    case email2 = "mail2@mail.ru"
    case email3 = "mail3@mail.ru"
}

class PostsProvider {
    static func getPosts(for user: User) -> [Post] {
        
        var posts = [Post]()
        
        switch user.email {
            
        case Emails.email1.rawValue:
            posts.append(Post(text: "Only text for \(user.email)", image: nil, time: "10 минут назад"))
            posts.append(Post(text: "Text with image for \(user.email)", image: UIImage(named: "profile3")!, time: "20 минут назад"))
            posts.append(Post(text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderi in voluptate velit esse cilum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: UIImage(named: "profile3")!, time: "40 минут назад"))
        case Emails.email2.rawValue:
            posts.append(Post(text: "Only text for \(user.email)", image: nil, time: "10 минут назад"))
            posts.append(Post(text: "Встал, покушал, сходил на учебу, лег спать, жизнь...", image: UIImage(named: "good"), time: "20 минут назад"))
            posts.append(Post(text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderi in voluptate velit esse cilum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: UIImage(named: "profile3")!, time: "40 минут назад"))
        case Emails.email3.rawValue:
            posts.append(Post(text: "Only text for \(user.email)", image: UIImage(named: "profile3")!, time: "10 минут назад"))
            posts.append(Post(text: "Text with image for \(user.email)", image: UIImage(named: "profile3")!, time: "20 минут назад"))
            posts.append(Post(text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderi in voluptate velit esse cilum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: UIImage(named: "good")!, time: "40 минут назад"))
        default:
            posts = []
        }
        return posts
    }
}
