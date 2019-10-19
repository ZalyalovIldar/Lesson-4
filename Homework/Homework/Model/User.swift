//
//  User.swift
//  Homework
//
//  Created by Роман Шуркин on 17/10/2019.
//  Copyright © 2019 Роман Шуркин. All rights reserved.
//

import Foundation
import UIKit

struct User {
    
    static let users: [User] = [
        User(avatarImage: "ava", year: "19 лет,", city: "Kazan", name: "Roman Shurkin", status: "Keep calm and go to IOS", dateOfBirth: "22.03.2000", homeTown: "Kazan", languages: ["Russian", "English"], location: "Kazan", instagram: "@romash_only", vk: "romashurkin", companyOne: "IOS", companyTwo: "IOS", school: "IT-лицей КФУ", university: "ИТИС КФУ", login: "roma.shurkin@mail.ru", password: "roman123"),
        User(avatarImage: "1", year: "15 лет,", city: "Pestretsy", name: "Lexa Jmurkin", status: "Keep calm and go to KFU", dateOfBirth: "22.03.2004", homeTown: "Nijnelamsk", languages: ["English"], location: "Kazan", instagram: "@ttr", vk: "ttr", companyOne: "Samsung", companyTwo: "SAMSUNG", school: "Школа 1", university: "", login: "lexattr@mail.ru", password: "ttr228")
    ]
    
    var id: String
    var avatarImage: String
    var avatar: UIImage
    var year: String
    var city: String
    var name: String
    var status: String
    var dateOfBirth: String
    var homeTown: String
    var languages: [String]
    var location: String
    var instagram: String
    var vk: String
    var companyOne: String
    var companyTwo: String
    var school: String
    var university: String
    
    var login: String
    var password: String
    
    static let avatars = [
        "1",
        "1_2",
        "1_3"
    ]
    static let years = [
        "19",
        "20",
        "30"
    ]
    static let cities = [
        "Kazan",
        "Pestretsy",
        "Moscow"
    ]
    static let names = [
        "Richard",
        "Abdula",
        "Ruslan",
        "Roman"
    ]
    static let statuses = [
        "Все хорошо!!!!",
        "Будь добрее",
        "Новость дня!!!",
        "Погода плохая"
    ]
    static let datesOfBirth = [
        "22.03.2000",
        "03.04.1999",
        "15.10.2001"
    ]
    static let homeTowns = [
        "Kazan",
        "Pestretsy",
        "Moscow",
        "Almet"
    ]
    static let arrayOfLanguages = [
        ["Russian"],
        ["English", "Russian"],
        ["Tatar", "English"]
    ]
    static let locations = [
        "Kazan",
        "Pestretsy",
        "Moscow",
        "Almet"
    ]
    static let instagrams = [
        "romash_only",
        "k322super",
        "ttr522"
    ]
    static let vks = [
        "romanshurkin",
        "aidarblednyi",
        "timurchernyi"
    ]
    static let companies = [
        "IOS Developer",
        "Company Of Tatarstan",
    ]
    static let schools = [
        "IT-liceym KFU",
        "131g",
        "177 school"
    ]
    static let universities = [
        "KFU ITIS",
        "KFU VMK",
        "Energo"
    ]
    
    init() {
        
        self.id = UUID().uuidString
        self.avatarImage = ""
        self.year =  ""
        self.city = ""
        self.name = ""
        self.status = ""
        self.dateOfBirth = ""
        self.homeTown = ""
        self.languages = [""]
        self.location = ""
        self.instagram = ""
        self.vk = ""
        self.companyOne = ""
        self.companyTwo = ""
        self.school = ""
        self.university = ""
        self.avatar = UIImage()
        self.login = ""
        self.password = ""
    }
    
    init(name: String, avatar: UIImage) {
    
        self.id = UUID().uuidString
        self.avatarImage = ""
        self.year =  ""
        self.city = ""
        self.name = ""
        self.status = ""
        self.dateOfBirth = ""
        self.homeTown = ""
        self.languages = [""]
        self.location = ""
        self.instagram = ""
        self.vk = ""
        self.companyOne = ""
        self.companyTwo = ""
        self.school = ""
        self.university = ""
        self.avatar = avatar
        self.login = ""
        self.password = ""
    }
    
    init(
        avatarImage: String,
        year: String,
        city: String,
        name: String,
        status: String,
        dateOfBirth: String,
        homeTown: String,
        languages: [String],
        location: String,
        instagram: String,
        vk: String,
        companyOne: String,
        companyTwo: String,
        school: String,
        university: String,
        login: String,
        password: String
    ) {
        
        self.id = UUID().uuidString
        self.avatarImage = avatarImage
        self.year = year
        self.city = city
        self.name = name
        self.status = status
        self.dateOfBirth = dateOfBirth
        self.homeTown = homeTown
        self.languages = languages
        self.location = location
        self.instagram = instagram
        self.vk = vk
        self.companyOne = companyOne
        self.companyTwo = companyTwo
        self.school = school
        self.university = university
        self.avatar = UIImage(named: avatarImage)!
        self.login = login
        self.password = password
    }
    
}

