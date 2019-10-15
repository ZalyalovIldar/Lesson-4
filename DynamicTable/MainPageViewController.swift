//
//  MainPageViewController.swift
//  DynamicTable
//
//  Created by Евгений on 13.10.2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit


protocol MainPageViewControllerDelegate: AnyObject {
    func didChangePost(post: Post)
    func deletePost(post: Post)
    func updateUser(user: User)
}

class MainPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MainPageViewControllerDelegate {
    
    let profileCellIdentifier = "profileInfoPartCell"
    let customCellIdentifier = "reusableCustomCell"
    let postDetailSegueIdentifier = "postDetailSegue"
    let toDetailProfileSegueIdentifier = "toDetailProfile"
    let userUserDefaultsIdentifier = "user"
    let estimatedRowHeight: CGFloat = 100
    
    var user: User!
    
    @IBOutlet weak var profileWallTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileWallTableView.estimatedRowHeight = estimatedRowHeight
        self.navigationItem.hidesBackButton = true
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        self.navigationItem.title = user.name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.posts.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = profileWallTableView.dequeueReusableCell(withIdentifier: profileCellIdentifier) as! ProfileInfoPartTableViewCell
            cell.configure(with: user)
            return cell
        } else {
            
            let cell = profileWallTableView.dequeueReusableCell(withIdentifier: customCellIdentifier) as! CustomTableViewCell
            cell.cellProfileNameAndSurname.text = "\(user.name) \(user.surname)"
            cell.cellProfileImageView.image = UIImage(named: user.profileImage)
            if let postText = user.posts[indexPath.row - 1].text {
                cell.cellProfilePostTextLabel.text = postText
            } else {
                
                cell.cellProfilePostTextLabel.text = nil
                cell.cellProfilePostTextLabel.isHidden = true
            }
            if let postImage = user.posts[indexPath.row - 1].image {
                cell.cellProfilePostImageView.image = UIImage(named: postImage)
            } else {
                
                cell.cellProfilePostImageView.image = nil
                cell.cellProfilePostImageView.isHidden = true
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            performSegue(withIdentifier: postDetailSegueIdentifier, sender: user.posts[indexPath.row - 1])
            profileWallTableView.deselectRow(at: indexPath, animated: false)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == toDetailProfileSegueIdentifier, let user = sender as? User {
            let destinationVC = segue.destination as? DetailProfileViewController
            destinationVC?.user = user
            destinationVC?.mainPageControllerDelegate = self
        }
        
        if segue.identifier == postDetailSegueIdentifier, let post = sender as? Post {
            let destinationVC = segue.destination as? PostDetailViewController
            destinationVC?.post = post
            destinationVC?.mainPageDelegate = self
        }
    }
    
    @IBAction func infoButtonPressed(_ sender: Any) {
        performSegue(withIdentifier : toDetailProfileSegueIdentifier, sender: user)
    }
    
    func didChangePost(post: Post) {
        if let postValue = user.posts.enumerated().first(where: { $0.element.id == post.id } ) {
            
            user.posts.remove(at: postValue.offset)
            user.posts.insert(post, at: postValue.offset)
            profileWallTableView.reloadData()
            saveData()
        }
    }
    
    func deletePost(post: Post) {
        if let postValue = user.posts.enumerated().first(where: { $0.element.id == post.id } ) {
            
            user.posts.remove(at: postValue.offset)
            profileWallTableView.reloadData()
            saveData()
        }
    }
    
    @IBAction func quitButtonPressed(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: userUserDefaultsIdentifier)
        UserDefaults.standard.synchronize()
        self.navigationController?.popViewController(animated: true)
    }
    
    func updateUser(user: User) {
        self.user = user
        saveData()
    }
    
    func saveData() {
        
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: userUserDefaultsIdentifier)
        }
    }
}

