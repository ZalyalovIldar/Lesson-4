//
//  EditingPostViewController.swift
//  DynamicTable
//
//  Created by Евгений on 14.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class EditingPostViewController: UIViewController {
    
    var post: Post?
    weak var postDetailControllerDelegate: PostDetailViewControllerDelegate?
    
    @IBOutlet weak var postTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTextView.text = post?.text
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        post?.text = postTextView.text
        postDetailControllerDelegate?.didChangePost(post: post!)
        self.navigationController?.popViewController(animated: true)
    }
    
}
