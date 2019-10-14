//
//  User.swift
//  DynamicTable
//
//  Created by Евгений on 13.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import Foundation

struct User {
    
    var email: String
    var password: String
    var name: String
    var surname: String
    var dateOfBirth: String
    var status: String
    var city: String
    var university: String
    var school: String
    var languages: [String]
    var presents: [String]
    var posts: [Post]
    var profileImage: String
    var jobs: [String]
    
    init(email: String, password: String, name: String, surname: String, status: String, dateOfBirth: String, city: String, university: String, school: String, languages: [String], presents: [String], posts: [Post], profileImage: String, jobs: [String]) {
        self.email = email
        self.password = password
        self.name = name
        self.surname = surname
        self.dateOfBirth = dateOfBirth
        self.status = status
        self.city = city
        self.university = university
        self.school = school
        self.languages = languages
        self.presents = presents
        self.posts = posts
        self.profileImage = profileImage
        self.jobs = jobs
    }
}

struct Post {
    
    static var counter = 0
    var text: String?
    var image: String?
    var id: Int
    
    init(text: String?, image: String?) {
        self.text = text
        self.image = image
        self.id = Post.counter
        Post.counter += 1
    }
}

let post1 = Post(text: "Hello this is small text without image!", image: nil)
let post2 = Post(text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", image: nil)
let post3 = Post(text: nil, image: "vkpresent1")
let post4 = Post(text: "2121", image: "vkpresent5")
let post5 = Post(text: nil, image: "vkpresent2")
let post6 = Post(text: "Swift — открытый мультипарадигмальный компилируемый язык программирования общего назначения. Создан компанией Apple в первую очередь для разработчиков iOS и macOS. Swift работает с фреймворками Cocoa и Cocoa Touch и совместим с основной кодовой базой Apple, написанной на Objective-C.", image: "picture1")

let arPosts1 = [post1, post2, post3, post4, post5, post6]
let arPosts2 = [post4, post5, post6]
let arPosts3 = [post1, post3, post5]

let users : [User] = [User(email: "superemail@mail.ru", password: "superadmin1", name: "Андрей", surname: "Суперадмин", status: "I am super admin", dateOfBirth: "10-11-1990", city: "Москва", university: "МГУ", school: "Школа №43", languages: ["Русский", "English"], presents: ["vkpresent1", "vkpresent5","vkpresent4"], posts: arPosts1, profileImage: "profileImage1", jobs: ["Microsoft", "Google"]), User(email: "egorthebest@gmail.com", password: "egorka2001", name: "Егор", surname: "Скороходов", status: "Отдыхаю :)", dateOfBirth: "03-04-1999", city: "Казань", university: "КФУ", school: "Лицей №17", languages: ["Русский", "Татарча"], presents: ["vkpresent1", "vkpresent2", "vkpresent4"], posts: arPosts2, profileImage: "profileImage2", jobs: ["IBM", "Yandex"]), User(email: "maksimus@ya.ru", password: "maksimilian390", name: "Максим", surname: "Иванов", status: "Работаю в поте лица", dateOfBirth: "17-06-2001", city: "Санкт-Петербург", university: "СПБГУ", school: "Гимназия №4", languages: ["Русский", "English"], presents: ["vkpresent3","vkpresent2","vkpresent2"], posts: arPosts3, profileImage: "profileImage3", jobs: ["Дикси", "Ашан"])]

let predicateFormat = "SELF MATCHES %@"
let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
let passwordRegEx = "([a-zA-Z]+[0-9]+[a-zA-Z]+)|([a-zA-z]+[0-9]+)|([0-9]+[a-zA-Z]+)(?=.*[0-9]).{6,}"

class UserManager {
    
    class func getUser(email: String, password: String) -> User? {
        for user in users {
            if (user.email == email)&&(user.password == password){
                return user
            }
        }
        return nil
    }
    
    class func isEmailValid(email: String) -> Bool {
        
        let emailPred = NSPredicate(format: predicateFormat, emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    class func isPasswordValid(password: String) -> Bool {

        let passwordTest = NSPredicate(format: predicateFormat, passwordRegEx)
        return passwordTest.evaluate(with: password)
    }
}
