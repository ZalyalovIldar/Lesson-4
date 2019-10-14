//
//  CustomTableViewCell.swift
//  DynamicTable
//
//  Created by Евгений on 13.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellProfileImageView: UIImageView!
    @IBOutlet weak var cellProfileNameAndSurname: UILabel!
    @IBOutlet weak var cellProfilePostTextLabel: UILabel!
    @IBOutlet weak var cellProfilePostImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellProfileImageView.layer.cornerRadius = cellProfileNameAndSurname.frame.size.width / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with user: User, post: Post) {
        
        cellProfileNameAndSurname.text = "\(user.name) \(user.surname)"
        cellProfileImageView.image = UIImage(named: user.profileImage)
        if let postText = post.text {
            cellProfilePostTextLabel.text = postText
        } else {
            cellProfilePostTextLabel.isHidden = true
        }
        if let postImage = post.image {
            cellProfilePostImageView.image = UIImage(named: postImage)
        } else {
            cellProfilePostImageView.isHidden = true
        }
        
    }
    
    override func prepareForReuse() {
        
        cellProfilePostTextLabel.isHidden = false
        cellProfilePostImageView.isHidden = false
    }
}
