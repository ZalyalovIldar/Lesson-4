//
//  Validator.swift
//  DynamicTable
//
//  Created by Amir on 17.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import Foundation

class DataValidator {
    
    static func validatePassword(with text: String) -> Bool {
        
        let decimals = CharacterSet.decimalDigits
        let decimalRange = text.rangeOfCharacter(from: decimals)
        
        let letters = CharacterSet.letters
        let lettersRange = text.rangeOfCharacter(from: letters)
        
        return text.count >= 6 && decimalRange != nil && lettersRange != nil        
    }
    
    static func validateEmail(email :String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
