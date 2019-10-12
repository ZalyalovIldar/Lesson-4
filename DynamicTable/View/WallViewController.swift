//
//  WallViewController.swift
//  DynamicTable
//
//  Created by Enoxus on 11/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class WallViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PostEditDelegate, PostDeleteDelegate, PageHeaderButtonDelegate {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    var posts = [Post]()
    var user: User!
    
    let staticCellsCount = 1
    let cellSpacingHeight: CGFloat = 10
    let fullPostSegueId = "showFullPostSegue"
    let userDetailSegueId = "showUserDetailsViewSegue"
    let logoutSegueId = "logoutSegue"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let currentUser = AuthManager.currentUser() {
            user = currentUser
            posts = PostProvider.getPosts(of: user)
        }
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.register(cell: TextAndImageCell.self)
        mainTableView.register(cell: PageHeaderCell.self)
        
        mainTableView.separatorColor = UIColor.clear
        
        navigationItem.setHidesBackButton(true, animated:true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section > 0 {
            performSegue(withIdentifier: fullPostSegueId, sender: posts[indexPath.section-1])
        }
        mainTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = mainTableView.dequeueReusableCell(withIdentifier: PageHeaderCell.nibName, for: indexPath) as! PageHeaderCell
            cell.configure(with: user, delegate: self)
                        
            return cell
        }
        else {
            
            let cell = mainTableView.dequeueReusableCell(withIdentifier: TextAndImageCell.nibName, for: indexPath) as! TextAndImageCell
            
            cell.configure(with: posts[indexPath.section - 1], user: user)
            
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return staticCellsCount + posts.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == fullPostSegueId, let post = sender as? Post {
            
            let destVC = segue.destination as! FullPostViewController
            destVC.configure(with: post, user: user, postDeleteDelegate: self, postEditDelegate: self)
        }
        else if segue.identifier == userDetailSegueId {
            
            let destVC = segue.destination as! UserInfoViewController
            destVC.configure(with: user)
        }
    }
    
    func saveButtonPressed(on post: Post, new: Post)  {
        
        if let postIndex = posts.firstIndex(where: { $0.id == post.id }) {
            
            posts.remove(at: postIndex)
            posts.insert(new, at: postIndex)
            mainTableView.reloadData()
        }
    }
    
    func deleteButtonPressed(on post: Post) {
        
        if let postIndex = posts.firstIndex(where: { $0.id == post.id }) {
            
            posts.remove(at: postIndex)
            mainTableView.reloadData()
        }
    }
    
    func pageInfoButtonPressed() {
        performSegue(withIdentifier: userDetailSegueId, sender: self)
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        
        AuthManager.logout()
        performSegue(withIdentifier: logoutSegueId, sender: self)
    }
}
