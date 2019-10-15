//
//  InfoCell.swift
//  DynamicTable
//
//  Created by Amir on 11.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell, CustomCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var bigImageView: UIImageView!
    
    @IBOutlet weak var whatsNewProfileImage: UIImageView!
    
    var model: User!
    weak var delegate: PageHeaderButtonDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with model: User) {
        
        profileImageView.image = UIImage(named: model.photo)
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.clipsToBounds = true
        
        nameLabel.text = model.name
        infoLabel.text = "\(model.age) лет, \(model.city)"
        
        editButton.layer.cornerRadius = editButton.frame.height / 2
        editButton.clipsToBounds = true
        
        bigImageView.image = UIImage(named: model.photo)
        
        whatsNewProfileImage.image = UIImage(named: model.photo)
        whatsNewProfileImage.layer.cornerRadius = whatsNewProfileImage.frame.height / 2
        whatsNewProfileImage.clipsToBounds = true
    }
    
    @IBAction func detailButtonPressed(_ sender: Any) {
        delegate?.pageInfoButtonPressed()
    }
    
    static func cellNibName() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static func cellIdentifier() -> String {
        String(describing: self)
    }
}
