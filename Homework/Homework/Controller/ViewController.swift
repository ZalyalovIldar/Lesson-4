//
//  ViewController.swift
//  Homework
//
//  Created by Роман Шуркин on 17/10/2019.
//  Copyright © 2019 Роман Шуркин. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func didChangeInfo(_ post: Post, _ isNewPost: Bool, _ forDelete: Bool)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddRepostCellDelegate, RepostCellDelegate, ViewControllerDelegate {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var heightOfPostCell: CGFloat = 399
    var heightOfAddPostCell: CGFloat = 44
    var row = 2
    var user: User!
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerCustomCell(AddRepostTableViewCell.self)
        tableView.registerCustomCell(RepostTableViewCell.self)
        
        posts.append(Post(user: user, date: "", text: "Может быть много нововстей, доабвляйте новые посты!!!", image: #imageLiteral(resourceName: "ava")))
        
        customAvatar()
        settingsUser()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: AddRepostTableViewCell.cellIden(), for: indexPath) as! AddRepostTableViewCell
            
            heightOfAddPostCell = cell.frame.height
            cell.configure(with: user, delegate: self)
            
            return cell
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: RepostTableViewCell.cellIden(), for: indexPath) as! RepostTableViewCell
                   
            heightOfPostCell = cell.frame.height
            
            let index = posts.count - indexPath.row
            let newPost = posts[index]
            
            cell.configure(with: newPost, delegate: self)
            cell.sizeToFit()

            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            
            self.tableView.deselectRow(at: indexPath, animated: true)
            let post = posts[posts.count - indexPath.row]
            performSegue(withIdentifier: "detailPost", sender: post)
        }
    }
    
    
    func didPressAction(for cell: UITableViewCell) {
        performSegue(withIdentifier: "addPost", sender: user)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addPost", let user = sender as? User {
            
            let destController = segue.destination as! AddPostViewController
            
            destController.post = Post(user: user, date: "", text: "", image: nil)
            destController.delegate = self
        }
        else if segue.identifier == "detailPost", let post = sender as? Post{
            
            let destController = segue.destination as! DetailPostViewController
            
            destController.post = post
            destController.delegate = self
        }
        else if segue.identifier == "infoUser", let user = sender as? User {
            
            let destController = segue.destination as! InfoUserViewController
            
            destController.user = user
        }
    }
    
    func didChangeInfo(_ post: Post, _ isNewPost: Bool, _ forDelete: Bool) {
        
        if isNewPost {
            posts.append(post)
            row = posts.count + 1
        }
        else if forDelete {
            let index = post.id
            print(index)
            posts.remove(at: index)
            
            var k = index + 1
            for post in posts {
                if post.id == k {
                    post.id -= 1
                    k += 1
                }
            }
            
            Post.postCount -= 1
            row -= 1
        }
        
        tableView.reloadData()
    }
    
    @IBAction func infoUserButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "infoUser", sender: user)
    }
    
    func customAvatar() {
        
        avatarImageView.layer.masksToBounds = false
        avatarImageView.layer.cornerRadius = (avatarImageView.bounds.width ) / 2
        avatarImageView.clipsToBounds = true
    }
    
    func settingsUser() {
        avatarImageView.image = user.avatar
        nameLabel.text = user.name
        ageLabel.text = user.year
        cityLabel.text = user.city
    }
}
