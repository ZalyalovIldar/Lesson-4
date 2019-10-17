//
//  NewStatusViewController.swift
//  Lesson2
//
//  Created by Amir on 28/09/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

class NewStatusViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var statusTextView: UITextView!
    
    var user: User!
    weak var delegate: EditStatusDelegate!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         
        statusTextView.text = user.status
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        
        user.status = statusTextView.text
        delegate.statusUpdated(with: statusTextView.text)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
