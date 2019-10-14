//
//  StatusEditingViewController.swift
//  DynamicTable
//
//  Created by Евгений on 14.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class StatusEditingViewController: UIViewController {
    
    var status: String?
    weak var detailProfileControllerDelegate: DetailProfileViewControllerDelegate?
    
    @IBOutlet weak var statusTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusTextView.text = status
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        status = statusTextView.text
        detailProfileControllerDelegate?.updateUserStatus(status: status!)
        self.navigationController?.popViewController(animated: true)
    }
}
