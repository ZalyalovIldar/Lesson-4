//
//  PostCell.swift
//  DynamicTable
//
//  Created by Amir on 11.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell, CustomCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    var post: Post!
    var user: User!
    
    override func prepareForReuse() {
        super.prepareForReuse()

        postTextLabel.isHidden = false
        postImageView.isHidden = false
    }
    
    func configure() {

        if let text = post.text {
            postTextLabel.text = text
            if post.image == nil {
                contentView.addConstraint(NSLayoutConstraint(item: separatorView!, attribute: NSLayoutConstraint.Attribute.topMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: postTextLabel, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 8))
            }
        }
        else {
            postTextLabel.isHidden = true
        }

        if let image = post.image {
            postImageView.image = image
            separatorView.isHidden = true
        }
        else {
            postImageView.isHidden = true
        }
        
        timeLabel.text = post.time

        profileImageView.image = UIImage(named: user.photo)
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2

        nameLabel.text = user.name
    }
    
    static func cellNibName() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
    
}
