//
//  TextAndImageCell.swift
//  DynamicTable
//
//  Created by Enoxus on 11/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class TextAndImageCell: UITableViewCell {

    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var postAuthorNameLabel: UILabel!
    
    var user: User!
    
    func configure(with post: Post, user: User) {
        
        if let text = post.text {
            postTextLabel.text = text
        }
        else {
            postTextLabel.isHidden = true
        }
        
        if let imageName = post.imageName {
            postImageView.image = UIImage(named: imageName)
        }
        else {
            postImageView.isHidden = true
        }
        
        self.user = user
        avatarImageView.image = UIImage(named: user.aviName)
        postAuthorNameLabel.text = user.name
    }
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        
        postTextLabel.isHidden = false
        postImageView.isHidden = false
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 2
    }
}
