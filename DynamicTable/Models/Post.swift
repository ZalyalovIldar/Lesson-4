//
//  Post.swift
//  DynamicTable
//
//  Created by Amir on 17.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

struct Post {
    
    let postId: String
    var text: String?
    var image: UIImage?
    var time: String?
    
    init(text: String, image: UIImage?, time: String) {
        self.text = text
        self.image = image
        self.time = time
        
        postId = UUID().uuidString
    }
}
