//
//  Post.swift
//  DynamicTable
//
//  Created by Enoxus on 11/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import Foundation

struct Post {
        
    let id: String
    let text: String?
    let imageName: String?
    
    init(text: String?, imageName: String?) {
        
        self.text = text
        self.imageName = imageName
        id = UUID().uuidString
    }
}