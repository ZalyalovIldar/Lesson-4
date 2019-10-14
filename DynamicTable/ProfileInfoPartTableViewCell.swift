//
//  ProfileInfoPartTableViewCell.swift
//  DynamicTable
//
//  Created by Евгений on 14.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class ProfileInfoPartTableViewCell: UITableViewCell {
    
    let dateFormat = "dd-MM-yyyy"
    let now = Date()
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageAndCityLabel: UILabel!
    @IBOutlet weak var photosImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with user: User) {
        
        nameLabel.text = user.name
        surnameLabel.text = user.surname
        profileImageView.image = UIImage(named: user.profileImage)
        dateFormatter.dateFormat = dateFormat
        let birthday: Date = dateFormatter.date(from: user.dateOfBirth)!
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        ageAndCityLabel.text = "\(ageComponents.year!) лет, \(user.city)"
        photosImageView.image = UIImage(named: user.profileImage)
    }
}
