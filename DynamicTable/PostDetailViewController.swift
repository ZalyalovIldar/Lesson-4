//
//  PostDetailViewController.swift
//  DynamicTable
//
//  Created by Евгений on 14.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit


protocol  PostDetailViewControllerDelegate: AnyObject {
    func didChangePost(post: Post)
}

class PostDetailViewController: UIViewController, PostDetailViewControllerDelegate {
    
    let editingControllerSegueIdentifier = "editingControllerSegue"
    
    var post: Post?
    weak var mainPageDelegate : MainPageViewControllerDelegate?
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var safeTopConsrtaint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        if let postText = post?.text {
            postTextLabel.text = postText
        } else {
            postTextLabel.isHidden = true
        }
        if let postImage = post?.image {
            postImageView.image = UIImage(named: postImage)
        } else {
            
            postImageView.isHidden = true
            postTextLabel.frame.origin.y = postImageView.frame.origin.y
            postTextLabel.frame.origin.x = postImageView.frame.origin.x
            postTextLabel.numberOfLines = 0
            topConstraint.isActive = false
            safeTopConsrtaint.constant = 10
        }
    }
    
    @IBAction func editingButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Редактирование", message: "", preferredStyle: .actionSheet)
        let editAction = UIAlertAction(title: "Редактировать", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            self.performSegue(withIdentifier: self.editingControllerSegueIdentifier, sender: self.post)
        })
        let removeAction = UIAlertAction(title: "Удалить", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            let removingAlert = UIAlertController(title: "Удалить пост?", message: "", preferredStyle: .actionSheet)
            let yesAction = UIAlertAction(title: "Удалить", style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                
                self.mainPageDelegate?.deletePost(post: self.post!)
                self.navigationController?.popViewController(animated: true)
            })
            let noAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            removingAlert.addAction(yesAction)
            removingAlert.addAction(noAction)
            self.present(removingAlert, animated: true, completion: nil)
        })
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        if post!.text != nil {
            alert.addAction(editAction)
        }
        alert.addAction(removeAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == editingControllerSegueIdentifier, let post = sender as? Post {
            
            let destinationVC = segue.destination as? EditingPostViewController
            destinationVC?.post = post
            destinationVC?.postDetailControllerDelegate = self
        }
    }
    
    func didChangePost(post: Post) {
        
        self.post = post
        postTextLabel.text = post.text
        mainPageDelegate?.didChangePost(post: post)
    }
}
