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
    
    let elementsInsets: CGFloat =  40
    var post: Post!
    var user: User!
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//
//        postTextLabel.isHidden = false
//        postImageView.isHidden = false
//    }
    
    func configure() {

        profileImageView.image = UIImage(named: user.photo)
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2

        nameLabel.text = user.name
        timeLabel.text = post.time

        postTextLabel.text = post.text
        postTextLabel.sizeToFit()

        postImageView.image = post.image

    }
    
//    func configure(post: Post, user: User) {
//
//        if let text = post.text {
//            postTextLabel.text = text
//        }
//        else {
//            postTextLabel.isHidden = true
//        }
//
//        if let image = post.image {
//            postImageView.image = image
//        }
//        else {
//            postImageView.isHidden = true
//        }
//
//        self.user = user
//
//        profileImageView.image = UIImage(named: user.photo)
//        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
//
//        nameLabel.text = user.name
//    }
    
    func calculateCellHeight() -> CGFloat {

        var cellHeight = profileImageView.frame.height + bottomView.frame.height + elementsInsets

        if postTextLabel.text != nil {
            postTextLabel.isHidden = false
            cellHeight += postTextLabel.frame.height
            separatorView.isHidden = false
        } else {
            postTextLabel.isHidden = true
        }

        if postImageView.image != nil {
            
            postImageView.isHidden = false
            
            cellHeight += postImageView.frame.height
            
            separatorView.isHidden = true
        } else {
            postImageView.isHidden = true
        }

        return cellHeight
    }
    
    static func cellNibName() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
    
}
