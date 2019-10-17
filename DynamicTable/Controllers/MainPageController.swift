//
//  MainPageController.swift
//  DynamicTable
//
//  Created by Amir on 11.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

class MainPageController: UIViewController, InfoButtonDelegate, EditPostDelegate, DeletePostDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var user: User!
    var posts: [Post]!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.register(InfoCell.cellNibName(), forCellReuseIdentifier: InfoCell.cellIdentifier())
        tableView.register(PostCell.cellNibName(), forCellReuseIdentifier: PostCell.cellIdentifier())
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
            
        case Constants.showUserDetailSegueId :
            let destVC = segue.destination as! DetailInfoViewController
            destVC.user = user
            
        case Constants.showFullPostId:
            
            if let post = sender as? Post {
                let destVC = segue.destination as! FullPostViewController
                
                destVC.post = post
                destVC.user = user
                destVC.postEditDelegate = self
                destVC.postDeleteDelegate = self
            }
        default:
            break
        }
    }
    
    func doneButtonPressed(on post: Post) {
        if let postIndex = posts.enumerated().first(where: { $0.element.postId == post.postId }) {
            
            posts.remove(at: postIndex.offset)
            posts.insert(post, at: postIndex.offset)
            
            tableView.reloadData()
        }
    }
    
    func deleteButtonPressed(on post: Post) {
        
        if let postIndex = posts.enumerated().first(where: { $0.element.postId == post.postId }) {
            
            posts.remove(at: postIndex.offset)
            tableView.reloadData()
        }
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: Constants.logoutSegueId, sender: self)
    
    }
    func pageInfoButtonPressed() {
        performSegue(withIdentifier: Constants.showUserDetailSegueId, sender: self)
    }
}

extension MainPageController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.cellIdentifier(), for: indexPath) as! InfoCell
            
            cell.configure(with: user)
            cell.delegate = self
            
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.cellIdentifier(), for: indexPath) as! PostCell
            
            cell.post = posts[indexPath.row - 1]
            cell.user = user
            
            cell.configure()
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            performSegue(withIdentifier: Constants.showFullPostId, sender: posts[indexPath.row - 1])
            print(posts[indexPath.row - 1].postId)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
