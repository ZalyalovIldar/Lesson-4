//
//  EditStatusViewController.swift
//  Homework
//
//  Created by Роман Шуркин on 17/10/2019.
//  Copyright © 2019 Роман Шуркин. All rights reserved.
//

import UIKit

class EditStatusViewController: UIViewController {

    @IBOutlet weak var newStatusTextView: UITextView!
    
    weak var delegate: InfoUserViewControllerDelegate?
    
    var textOfStatus: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newStatusTextView.text = textOfStatus
    }
    
    @IBAction func changeStatus(_ sender: Any) {
        
        delegate?.didChangeStatus(newStatusTextView.text)
        dismiss(animated: true, completion: nil)
    }
}
