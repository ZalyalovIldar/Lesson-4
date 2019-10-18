//
//  FullInformationVC.swift
//  Vk_wall
//
//  Created by Азат Султанов on 19.10.2019.
//  Copyright © 2019 Прокопьев Павел. All rights reserved.
//

import UIKit

class fullInformationVC: UIViewController {

    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var religionLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var homeTownLabel: UILabel!
    
    @IBOutlet weak var gift1Image: UIImageView!
    @IBOutlet weak var gift2Image: UIImageView!
    @IBOutlet weak var gift3Image: UIImageView!
    
    var account: Account?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImage.image = UIImage(named: (account?.avatar!)!)
        religionLabel.text = account?.religion
        schoolLabel.text = account?.school
        homeTownLabel.text = account?.homeTown
        gift1Image.image = UIImage(named: (account?.gifts![0])!)
        gift2Image.image = UIImage(named: (account?.gifts![1])!)
        gift3Image.image = UIImage(named: (account?.gifts![2])!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
