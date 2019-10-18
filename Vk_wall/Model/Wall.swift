//
//  Wall.swift
//  Vk_wall
//
//  Created by Азат Султанов on 12.10.2019.
//  Copyright © 2019 Прокопьев Павел. All rights reserved.
//

import Foundation
class Wall{
    var avatar: String?
    let name: String?
    var text: String?
    var image: String?
    var id: Int?
    init(avatar: String, text: String?, name: String, image: String?, id: Int) {
        self.avatar = avatar
        self.text = text
        self.name = name
        self.image = image
        self.id = id
    }
}
