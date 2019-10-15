//
//  User.swift
//  DynamicTable
//
//  Created by Amir on 11.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

struct User {
    
    let email: String
    let password: String
    
    let name: String
    let age: Int
    let city: String
    let photo: String
    
    var status: String
    
    let birthday: String
    
    let university: String
    let faculty: String
    
    let schoolName: String
    let schoolCity: String
    let schoolYears: String
    
    let languages: String
    
    let vkId: String
    let instagramName: String
    let phone: String
    
    let gifts: [UIImage]
    
    let firstCompanyName: String
    let firstCompanyInfo: String
    let firstCompanyPosition: String
    
    let secondCompanyName: String
    let secondCompanyInfo: String
    let secondCompanyPosition: String
    
}

struct Post {
    
    var postId = 0
    var text: String?
    var image: UIImage?
    var time: String?
    
    init(text: String, image: UIImage?, time: String) {
        self.text = text
        self.image = image
        self.time = time
        
        postId += 1
    }
}
