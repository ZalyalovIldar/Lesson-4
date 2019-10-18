//
//  UserInfoViewController.swift
//  DynamicTable
//
//  Created by Amir on 11/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class DetailInfoViewController: UIViewController, EditStatusDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageAndCityLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var changeStatusLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var currentStudyLabel: UILabel!
    @IBOutlet weak var vkProfileLabel: UILabel!
    @IBOutlet weak var instagramLabel: UILabel!
    
    @IBOutlet weak var firstCompanyNameLabel: UILabel!
    @IBOutlet weak var firstCompanyInfoLabel: UILabel!
    @IBOutlet weak var firstCompanyPositionLabel: UILabel!
    
    @IBOutlet weak var secondCompanyNameLabel: UILabel!
    @IBOutlet weak var secondCompanyInfoLabel: UILabel!
    @IBOutlet weak var secondCompanyPositionLabel: UILabel!
    
    @IBOutlet weak var universityNameLabel: UILabel!
    @IBOutlet weak var facultyNameLabel: UILabel!
    
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var schoolCityLabel: UILabel!
    
    @IBOutlet var giftImageViews: [UIImageView]!
    
    var user: User!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureUI()
        checkStatus()
    }
    
    func configureUI() {
        
        profileImageView.layer.cornerRadius = profileImageView.bounds.height/2
        
        title = user.name.components(separatedBy: " ").first
        
        profileImageView.image = UIImage(named: user.photo)
        nameLabel.text = user.name
        ageAndCityLabel.text = "\(user.age) лет, \(user.city)"
        birthdayLabel.text = user.birthday
        currentStudyLabel.text = user.university
        vkProfileLabel.text = user.vkId
        
        changeStatusLabel.text = user.status
        
        instagramLabel.text = user.instagramName
        
        firstCompanyNameLabel.text = user.firstCompanyName
        firstCompanyInfoLabel.text = user.firstCompanyInfo
        firstCompanyPositionLabel.text = user.firstCompanyPosition
        
        secondCompanyNameLabel.text = user.secondCompanyName
        secondCompanyInfoLabel.text = user.secondCompanyInfo
        secondCompanyPositionLabel.text = user.secondCompanyPosition
        
        universityNameLabel.text = user.university
        facultyNameLabel.text = user.faculty
        schoolNameLabel.text = user.schoolName
        schoolCityLabel.text = user.schoolCity
        
        for giftImageView in giftImageViews.enumerated() {
            giftImageView.element.image = UIImage(named: "gift\(giftImageView.offset + 1)")
        }
    }
    
    func statusUpdated(with text: String) {
        user.status = text
    }
    
    func checkStatus() {
        
        if user.status.isEmpty {
            changeStatusLabel.text = "Изменить статус"
            statusLabel.isHidden = true
        }
        else {
            changeStatusLabel.text = user.status
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == Constants.editStatusSegueId {
            let destVC = segue.destination as! NewStatusViewController
            destVC.user = user
            destVC.delegate = self
        }
    }
    
    @IBAction func editStatusButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: Constants.editStatusSegueId, sender: self)
    }
}
