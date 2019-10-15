//
//  Protocols.swift
//  DynamicTable
//
//  Created by Amir on 13.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol PostDeleteDelegate: AnyObject {
    
    func deleteButtonPressed(on post: Post)
}

protocol PostEditDelegate: AnyObject {
    
    func doneButtonPressed(on post: Post)
}

protocol PageHeaderButtonDelegate: AnyObject {
    
    func pageInfoButtonPressed()
}

protocol StatusEditDelegate: AnyObject {
    func statusUpdated(with text: String)
}

