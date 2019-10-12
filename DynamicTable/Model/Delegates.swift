//
//  Delegates.swift
//  DynamicTable
//
//  Created by Enoxus on 11/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol PostDeleteDelegate: AnyObject {
    
    func deleteButtonPressed(on post: Post)
}

protocol PostEditDelegate: AnyObject {
    
    func saveButtonPressed(on post: Post, new: Post)
}

protocol PageHeaderButtonDelegate: AnyObject {
    
    func pageInfoButtonPressed()
}

protocol UserEditDelegate: AnyObject {
    
    func saveButtonPressed(on user: User, new: User)
}
