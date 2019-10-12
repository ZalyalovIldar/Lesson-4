//
//  EditStatusViewController.swift
//  DynamicTable
//
//  Created by Enoxus on 11/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class EditStatusViewController: UIViewController {

    @IBOutlet weak var statusTextView: UITextView!
    
    var user: User!
    
    weak var userEditDelegate: UserEditDelegate?
    
    func configure(with user: User, userEditDelegate: UserEditDelegate?) {
        
        self.user = user
        self.userEditDelegate = userEditDelegate
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        statusTextView.text = user.status
    }
    
    @IBAction func cancelEditingButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        let newStatus = statusTextView.text ?? ""
        
        let newUser = User(name: user.name, online: user.online, aviName: user.aviName, ageAndCity: user.ageAndCity, status: newStatus, birthday: user.birthday, currentStudy: user.currentStudy, vkProfile: user.vkProfile, telegramProfile: user.telegramProfile, firstCompanyName: user.firstCompanyName, firstCompanyCityAndYear: user.firstCompanyCityAndYear, firstCompanyPosition: user.firstCompanyPosition, secondCompanyName: user.secondCompanyName, secondCompanyCityAndYear: user.secondCompanyCityAndYear, secondCompanyPosition: user.secondCompanyPosition, universityName: user.universityName, facultyName: user.facultyName, schoolName: user.schoolName, schoolCityName: user.schoolCityName, giftNames: user.giftNames, email: user.email, password: user.password)
        
        userEditDelegate?.saveButtonPressed(on: user, new: newUser)
        dismiss(animated: true)
    }
}
