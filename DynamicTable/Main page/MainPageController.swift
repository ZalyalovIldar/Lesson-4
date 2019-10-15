//
//  MainPageController.swift
//  DynamicTable
//
//  Created by Amir on 11.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit


protocol CustomCell {
    
    static func cellNibName() -> UINib?
    static func cellIdentifier() -> String
}

class MainPageController: UIViewController, UITableViewDelegate, UITableViewDataSource, PageHeaderButtonDelegate, PostEditDelegate, PostDeleteDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var user: User!
    var posts: [Post]!
    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.register(InfoCell.cellNibName(), forCellReuseIdentifier: InfoCell.cellIdentifier())
        tableView.register(PostCell.cellNibName(), forCellReuseIdentifier: PostCell.cellIdentifier())
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return posts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.cellIdentifier(), for: indexPath) as! InfoCell
            
            cell.configure(with: user)
            cell.delegate = self
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.cellIdentifier(), for: indexPath) as! PostCell
        
            cell.post = posts[indexPath.row]
            cell.user = user
            cell.configure()
            
            tableView.rowHeight = cell.calculateCellHeight()
            
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if indexPath.section == 1 {
            performSegue(withIdentifier: Constants.showFullPost, sender: posts[indexPath.row])
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
            
        case Constants.showUserDetailInfo :
            let destVC = segue.destination as! DetailInfoViewController
            destVC.user = user
            
        case Constants.showFullPost:
            
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
        
        if let postIndex = posts.firstIndex(where: { $0.postId == post.postId }) {
            
            posts.remove(at: postIndex)
            tableView.reloadData()
        }
    }
    
    func pageInfoButtonPressed() {
        performSegue(withIdentifier: Constants.showUserDetailInfo, sender: self)
    }
}
