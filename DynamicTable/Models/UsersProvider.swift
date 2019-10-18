//
//  UsersProvider.swift
//  DynamicTable
//
//  Created by Amir on 17.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

enum Emails: String {
    case email1 = "mail1@mail.ru"
    case email2 = "mail2@mail.ru"
    case email3 = "mail3@mail.ru"
}

class UsersProvider {
    
    private static let usersArray = [User(email: Emails.email1.rawValue,
                                          password: "user01",
                                          name: "Амир Марданов",
                                          age: 18,
                                          city: "Казань",
                                          photo: "profile",
                                          status: "ALLLLL",
                                          birthday: "15 октября 2000 г.",
                                          university: "КФУ (бывш. КГУ им. Ульянова-Ленина)",
                                          faculty: "Высшая школа информационных технологий и интеллектульных систем",
                                          schoolName: "IT-лицей КФУ '18",
                                          schoolCity: "Казань",
                                          schoolYears: "2014-2018",
                                          languages: "Русский, English",
                                          vkId: "omeeer78",
                                          instagramName: "omeeer78",
                                          phone: "79991553468",
                                          gifts: ["gift1",
                                                  "gift2"],
                                          firstCompanyName: "Flatstack",
                                          firstCompanyInfo: "Казань, 2020-2022",
                                          firstCompanyPosition: "iOS Developer",
                                          secondCompanyName: "Apple",
                                          secondCompanyInfo: "Cupertino, с 2022 г.",
                                          secondCompanyPosition: "CEO"),
                                     User(email: Emails.email2.rawValue,
                                          password: "user02",
                                          name: "Тим Кук",
                                          age: 58,
                                          city: "Купертино",
                                          photo: "profile2",
                                          status: "Make Apple great again",
                                          birthday: "1 ноября 19600 г.",
                                          university: "КФУ (бывш. КГУ им. Ульянова-Ленина)",
                                          faculty: "Высшая школа информационных технологий и интеллектульных систем",
                                          schoolName: "IT-лицей КФУ '18",
                                          schoolCity: "Казань",
                                          schoolYears: "2014-2018",
                                          languages: "Русский, English, Татарча",
                                          vkId: "cook60",
                                          instagramName: "cook60",
                                          phone: "79991553468",
                                          gifts: ["gift1",
                                                  "gift2"],
                                          firstCompanyName: "Flatstack",
                                          firstCompanyInfo: "Казань, 2010-2011",
                                          firstCompanyPosition: "iOS Developer",
                                          secondCompanyName: "Apple",
                                          secondCompanyInfo: "Cupertino, с 2011 г.",
                                          secondCompanyPosition: "CEO"),
                                     User(email: Emails.email3.rawValue,
                                          password: "user03",
                                          name: "Филипп Киркоров",
                                          age: 52,
                                          city: "София",
                                          photo: "profile4",
                                          status: "Цвет настроения синий",
                                          birthday: "30 апреля 1967 г.",
                                          university: "КФУ (бывш. КГУ им. Ульянова-Ленина)",
                                          faculty: "Высшая школа информационных технологий и интеллектульных систем",
                                          schoolName: "IT-лицей КФУ '18",
                                          schoolCity: "Казань",
                                          schoolYears: "2014-2018",
                                          languages: "Русский, English, Болгарский",
                                          vkId: "fkirkorov",
                                          instagramName: "fkirkorov",
                                          phone: "79991553469",
                                          gifts: ["gift1",
                                                  "gift2",
                                                  "gift3"],
                                          firstCompanyName: "Болгарская консерватория",
                                          firstCompanyInfo: "Болгария, 2010-2011",
                                          firstCompanyPosition: "Певец",
                                          secondCompanyName: "ИП Киркоров",
                                          secondCompanyInfo: "Москва, с 2011 г.",
                                          secondCompanyPosition: "Самый главный")]
    
    static func auth(email: String, password: String)  -> User? {
        
        for user in usersArray {
            if user.email == email && user.password == password {
                
                UserDefaults.standard.set(try? JSONEncoder().encode(user), forKey: "user")
                
                return user
            }
        }
        return nil
    }
    
    static func getAuthorizedUser() -> User? {
        guard let userData = UserDefaults.standard.data(forKey: "user") else { return nil }
        let user = try? JSONDecoder().decode(User.self, from: userData)
        return user
    }
}
