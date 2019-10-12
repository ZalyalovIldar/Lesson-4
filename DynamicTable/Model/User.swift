//
//  User.swift
//  DynamicTable
//
//  Created by Enoxus on 11/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import Foundation

struct User: Codable {
    
    let name: String
    let online: Bool
    let aviName: String
    let ageAndCity: String
    let status: String
    let birthday: String
    let currentStudy: String
    let vkProfile: String
    let telegramProfile: String
    let firstCompanyName: String
    let firstCompanyCityAndYear: String
    let firstCompanyPosition: String
    let secondCompanyName: String
    let secondCompanyCityAndYear: String
    let secondCompanyPosition: String
    let universityName: String
    let facultyName: String
    let schoolName: String
    let schoolCityName: String
    let giftNames: [String]
    let email: String
    let password: String
}
