//
//  InfoUserViewController.swift
//  Homework
//
//  Created by Роман Шуркин on 17/10/2019.
//  Copyright © 2019 Роман Шуркин. All rights reserved.
//

import UIKit

protocol InfoUserViewControllerDelegate: AnyObject {
    func didChangeStatus(_ textOfStatus: String)
}

class InfoUserViewController: UIViewController, InfoUserViewControllerDelegate {
    
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var homeTownLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var instagramLabel: UILabel!
    @IBOutlet weak var vkLabel: UILabel!
    @IBOutlet weak var companyOneLabel: UILabel!
    @IBOutlet weak var companyTwoLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var giftFirstImage: UIImageView!
    @IBOutlet weak var giftSecondImage: UIImageView!
    @IBOutlet weak var giftThirdImage: UIImageView!
    
    let constStatusString = "Изменить статус"
    var user: User!
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if statusLabel.text == constStatusString {
            statusLabel.textColor = .gray
        }
        else {
            statusLabel.textColor = .black
        }
        
        settingsUser()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        customScroll()
        customAvatar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "changeStatus" {
            
            let destController = segue.destination as! EditStatusViewController
            
            destController.textOfStatus = statusLabel.text
            destController.delegate = self
        }
    }
    
    func customScroll() {
        scroller?.contentSize = CGSize(width: 300, height: 1000)
    }
    
    func customAvatar() {
        
        avatarImage?.layer.masksToBounds = false
        avatarImage?.layer.cornerRadius = (avatarImage?.bounds.width ?? 0) / 2
        avatarImage?.clipsToBounds = true
    }
    
    func didChangeStatus(_ textOfStatus: String) {
        user.status = textOfStatus
        statusLabel.text = textOfStatus
    }

    func settingsUser() {
        
        avatarImage.image = user.avatar
        yearLabel.text = user.year
        cityLabel.text = user.city
        nameLabel.text = user.name
        statusLabel.text = user.status
        dateOfBirthLabel.text = user.dateOfBirth
        homeTownLabel.text = user.homeTown
        languagesLabel.text = user.languages.first
        locationLabel.text = user.location
        instagramLabel.text = user.instagram
        vkLabel.text = user.vk
        companyOneLabel.text = user.companyOne
        companyTwoLabel.text = user.companyTwo
        schoolLabel.text = user.school
        universityLabel.text = user.university
        giftFirstImage.image = UIImage(named: "2")
        giftSecondImage.image = UIImage(named: "3")
        giftThirdImage.image = UIImage(named: "4")
    }
}
