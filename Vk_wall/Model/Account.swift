//
//  Account.swift
//  VK
//
//  Created by Азат Султанов on 14.10.2019.
//  Copyright © 2019 Прокопьев Павел. All rights reserved.
//

import Foundation
class Account {
    var fullName: String?
    var age: String?
    var avatar: String?
    var lateTime: String?
    var vkID: Int = Int.random(in: 100000...999999)
    var religion: String?
    var school: String?
    var homeTown: String?
    var gifts: [String]?
    var posts: [Wall] = []
    init(_ number: Int){
        self.generate(number: number)
    }
    
    func generate(number: Int){
        switch number {
        case 1:
            fullName = "Павел Прокопьев"
            age = "19"
            avatar = "Avatar1"
            lateTime = "Был в сети 5 минут назад"
            religion = "Атеизм"
            school = "Сош 61"
            homeTown = "Чебоксары"
            gifts = ["gift1","gift2","gift1"]
            posts.append(Wall(avatar: self.avatar!, text: "Здарова бандиты", name: self.fullName!, image: "Море", id: 1))
            posts.append(Wall(avatar: self.avatar!, text: "Чо каво", name: self.fullName!, image: "Кисик", id: 2))
            
        case 2:
            fullName = "Денис Афанасьев"
            age = "20"
            avatar = "avatar2"
            religion = "Православие"
            school = "Лицей 7"
            homeTown = "Чебоксары"
            gifts = ["gift1","gift2","gift1"]
            posts.append(Wall(avatar: self.avatar!, text: "Мама купила вкусняшку", name: self.fullName!, image: "Вкусняшка", id: 1))
            posts.append(Wall(avatar: self.avatar!, text: "Буду бондитом", name: self.fullName!, image: "Цитата", id: 2))
            
        case 3:
            fullName = "Азат Султанов"
            age = "18"
            avatar = "avatar3"
            religion = "ББПЕ"
            school = "Гимназия 5"
            homeTown = "Новый Оренгой"
            gifts = ["gift1","gift2","gift1"]
            posts.append(Wall(avatar: self.avatar!, text: "Сибирь", name: self.fullName!, image: "Сибирь", id: 1))
            posts.append(Wall(avatar: self.avatar!, text: "Арсик <3", name: self.fullName!, image: "Арсик", id: 2))
            
        default:
            print("Error")
        }
    }
}

class LoginsAndPasswords {
    var data: [Data] = []
    init() {
        data.append(Data(email: "Test1@gmail.com", password: "Password1"))
        data.append(Data(email: "Test2@gmail.com", password: "Password2"))
        data.append(Data(email: "Test3@gmail.com", password: "Password3"))
    }
    func checkValid(email: String, password: String) -> Bool {
        let check = data.enumerated().first(where: {$0.element.email == email && $0.element.password == password})
        return check != nil
        }
}

class Data {
    var email: String?
    var password: String?
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
}

