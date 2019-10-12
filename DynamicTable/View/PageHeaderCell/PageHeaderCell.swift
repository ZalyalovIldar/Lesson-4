//
//  PageHeaderCell.swift
//  DynamicTable
//
//  Created by Enoxus on 11/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class PageHeaderCell: UITableViewCell {

    @IBOutlet weak var aviImageView: UIImageView!
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var ageAndCityLabel: UILabel!
    @IBOutlet weak var lowerImageView: UIImageView!
    
    weak var delegate: PageHeaderButtonDelegate?
    
    var user: User!
    
    func configure(with user: User, delegate: PageHeaderButtonDelegate) {
        self.delegate = delegate
        self.user = user
        
        aviImageView.image = UIImage(named: user.aviName)
        lowerImageView.image = UIImage(named: user.aviName)
        nameTextLabel.text = user.name
        ageAndCityLabel.text = user.ageAndCity
    }

    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        aviImageView.layer.cornerRadius = aviImageView.bounds.height / 2
    }
    
    @IBAction func infoButtonPressed(_ sender: Any) {
        delegate?.pageInfoButtonPressed()
    }
}
