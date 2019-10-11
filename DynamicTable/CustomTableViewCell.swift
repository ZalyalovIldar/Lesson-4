//
//  CustomTableViewCell.swift
//  DynamicTable
//
//  Created by Ильдар Залялов on 09/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var someTextLabel: UILabel!
    
    
    func configure(with text: String) {
    
        avatarImageView.image = UIImage(named: "image1")
        someTextLabel.text = text 
    }

}
