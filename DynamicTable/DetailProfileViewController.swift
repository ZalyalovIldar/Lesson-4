//
//  DetailProfileViewController.swift
//  DynamicTable
//
//  Created by Евгений on 14.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

protocol DetailProfileViewControllerDelegate: AnyObject {
    func updateUserStatus(status: String)
}
class DetailProfileViewController: UIViewController, DetailProfileViewControllerDelegate {
    
    let dateFormat = "dd-MM-yyyy"
    let now = Date()
    let dateFormatter = DateFormatter()
    let statusEditingSegueIdentifier = "statusEditingSegue"
    
    var user: User?
    weak var mainPageControllerDelegate: MainPageViewControllerDelegate?

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileSurnameLabel: UILabel!
    @IBOutlet weak var profileAgeAndCityLabel: UILabel!
    @IBOutlet weak var profileStatusLabel: UILabel!
    @IBOutlet weak var profileDateOfBirthLabel: UILabel!
    @IBOutlet weak var profileCityLabel: UILabel!
    @IBOutlet weak var profileUniversityLabel: UILabel!
    @IBOutlet weak var profileLanguagesLabel: UILabel!
    @IBOutlet weak var profileEducationUniversityLabel: UILabel!
    @IBOutlet weak var profileEducationSchoolLabel: UILabel!
    @IBOutlet weak var profileFisrtJobLabel: UILabel!
    @IBOutlet weak var profileSecondJobLabel: UILabel!
    @IBOutlet weak var profileFirstPresentImageView: UIImageView!
    @IBOutlet weak var profileSecondPresentImageView: UIImageView!
    @IBOutlet weak var profileThirdPresentImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = user?.name
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.image = UIImage(named: user!.profileImage)
        profileNameLabel.text = user?.name
        profileSurnameLabel.text = user?.surname
        dateFormatter.dateFormat = dateFormat
        let birthday: Date = dateFormatter.date(from: user!.dateOfBirth)!
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        profileAgeAndCityLabel.text = "\(ageComponents.year!) лет, \(user!.city)"
        profileStatusLabel.text = user?.status
        profileDateOfBirthLabel.text = user?.dateOfBirth
        profileCityLabel.text = user?.city
        profileUniversityLabel.text = user?.university
        profileLanguagesLabel.text = "\(user!.languages[0]), \(user!.languages[1])"
        profileEducationUniversityLabel.text = user?.university
        profileEducationSchoolLabel.text = user?.school
        profileFisrtJobLabel.text = user?.jobs[0]
        profileSecondJobLabel.text = user?.jobs[1]
        profileFirstPresentImageView.image = UIImage(named: (user?.presents[0])!)
        profileSecondPresentImageView.image = UIImage(named: (user?.presents[1])!)
        profileThirdPresentImageView.image = UIImage(named: (user?.presents[2])!)
        
    }
    
    @IBAction func statusEditingButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: statusEditingSegueIdentifier, sender: user?.status)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == statusEditingSegueIdentifier, let _ = sender as? String {
            
            let destinationVC = segue.destination as? StatusEditingViewController
            destinationVC?.status = user?.status
            destinationVC?.detailProfileControllerDelegate = self
        }
    }
    
    func updateUserStatus(status: String) {
        
        self.user?.status = status
        profileStatusLabel.text = status
        mainPageControllerDelegate!.updateUser(user: self.user!)
    }
}
