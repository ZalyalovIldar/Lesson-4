//
//  Extensions.swift
//  DynamicTable
//
//  Created by Enoxus on 11/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func register(cell: UITableViewCell.Type) {
        self.register(UINib(nibName: cell.nibName, bundle: nil), forCellReuseIdentifier: cell.nibName)
    }
}

extension UITableViewCell {
    
    static var nibName: String {
        
        get {
            return String(describing: self)
        }
    }
}

extension UIView {
    
    func addTopBorder() {
        
        let border = CALayer()
        border.backgroundColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: 0.25)
        self.layer.addSublayer(border)
    }
    
    func addBottomSeparator() {
        
        let border = CALayer()
        border.backgroundColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 20, y: self.frame.size.height - 0.5, width: self.frame.size.width, height: 0.5)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorder() {
        
        let border = CALayer()
        border.backgroundColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - 0.5, width: self.frame.size.width, height: 0.5)
        self.layer.addSublayer(border)
    }
    
    func addBorders() {
        
        self.addTopBorder()
        self.addBottomBorder()
    }
}

extension String {
    
    func isValidEmail() -> Bool {

        let regex = try! NSRegularExpression(pattern: "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" +
        "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
        "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" +
        "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" +
        "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
        "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])", options: .caseInsensitive)
        
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    func isValidPassword() -> Bool {
        
        let regex = try! NSRegularExpression(pattern: "([a-zA-Z]+[0-9]+[a-zA-Z]+)|([a-zA-z]+[0-9]+)|([0-9]+[a-zA-Z]+)")
        
        return self.count >= 6 && regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
