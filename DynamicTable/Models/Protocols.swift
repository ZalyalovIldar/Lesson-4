//
//  Protocols.swift
//  DynamicTable
//
//  Created by Amir on 13.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

protocol DeletePostDelegate: AnyObject {
    func deleteButtonPressed(on post: Post)
}

protocol EditPostDelegate: AnyObject {
    func doneButtonPressed(on post: Post)
}

protocol InfoButtonDelegate: AnyObject {
    func pageInfoButtonPressed()
}

protocol EditStatusDelegate: AnyObject {
    func statusUpdated(with text: String)
}

protocol CustomCell {
    
    static func cellNibName() -> UINib?
    static func cellIdentifier() -> String
}
