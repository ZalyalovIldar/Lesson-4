//
//  AuthManager.swift
//  DynamicTable
//
//  Created by Enoxus on 11/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import Foundation

class AuthManager {
    
    private class var database: [User] {
        
        get {
            
            let user1 = User(name: "Никита Афанасьев", online: false, aviName: "avi1", ageAndCity: "Казань, 19 лет", status: "roadto5k", birthday: "7 декабря 1999г.", currentStudy: "Казанский Федеральный Университет", vkProfile: "enoxus", telegramProfile: "@Enoxus", firstCompanyName: "Flatstack", firstCompanyCityAndYear: "Казань, 2020", firstCompanyPosition: "iOS Developer", secondCompanyName: "Enoxus Soft", secondCompanyCityAndYear: "New York, 2022", secondCompanyPosition: "CEO", universityName: "КФУ (бывш. КГУ им. Ульянова-Ленина '22", facultyName: "Высшая Школа информационных технологий и интеллектуальных систем", schoolName: "Лицей №2 (ЕМГЛи) '18", schoolCityName: "Альметьевск", giftNames: ["gift1", "gift1", "gift1", "gift2"], email: "email1@gmail.com", password: "passwrd1")
            
            let user2 = User(name: "Нариман Намазов", online: true, aviName: "avi2", ageAndCity: "Москва, 35 лет", status: "", birthday: "7 декабря 1983г.", currentStudy: "МГУ", vkProfile: "abunyasha", telegramProfile: "@abunyasha", firstCompanyName: "NoNameInc", firstCompanyCityAndYear: "Москва, 2008", firstCompanyPosition: "Senior Anykey", secondCompanyName: "2ch", secondCompanyCityAndYear: "Москва, 2010", secondCompanyPosition: "CEO", universityName: "Московский Государственный Университет им. М.В. Ломоносова", facultyName: "Механико-математический факультет", schoolName: "СОШ №1488", schoolCityName: "Москва", giftNames: ["gift2", "gift1", "gift2", "gift2"], email: "email2@gmail.com", password: "passwrd2")
            
            let user3 = User(name: "Денис Петров", online: false, aviName: "avi3", ageAndCity: "Самара, 54 года", status: "Хочу пиццы", birthday: "7 декабря 1964г.", currentStudy: "Самарский Федеральный Университет", vkProfile: "deniskaPodStolikom", telegramProfile: "@gvs", firstCompanyName: "Twitch", firstCompanyCityAndYear: "Самара, 2009", firstCompanyPosition: "Стример", secondCompanyName: "YouTube", secondCompanyCityAndYear: "Самара, 2019", secondCompanyPosition: "Стример", universityName: "ПТУ №54", facultyName: "Заборостроительный факультет", schoolName: "Церковно-приходская воскресная школа №1", schoolCityName: "Самара", giftNames: ["gift1", "gift1", "gift1", "gift2"], email: "email3@gmail.com", password: "passwrd3")
            
            return [user1, user2, user3]
        }
    }
    
    class func authenticate(email: String, password: String) -> User? {
        
        for user in database {
            
            if user.email == email && user.password == password {
                
                UserDefaults.standard.set(try! JSONEncoder().encode(user), forKey: "authenticatedUser")
                
                return user
            }
        }
        
        return nil
    }
    
    class func currentUser() -> User? {
        
        if let data = UserDefaults.standard.data(forKey: "authenticatedUser") {
            return try! JSONDecoder().decode(User.self, from: data)
        }
        else {
            return nil
        }
    }
    
    class func logout() {
        UserDefaults.standard.removeObject(forKey: "authenticatedUser")
    }
}
 
