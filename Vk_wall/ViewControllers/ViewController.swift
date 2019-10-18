//
//  ViewController.swift
//  Vk_wall
//
//  Created by Азат Султанов on 12.10.2019.
//  Copyright © 2019 Прокопьев Павел. All rights reserved.
//

import UIKit
protocol ViewControllerDelegate: AnyObject {
    func didChangeText(_ post: Wall)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegate, ViewControllerDelegate {
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var lateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    let fullPostIdentifier = "fullPostIdentifier"
    let editIdentifier = "editIdentifier"
    let detailInformationIdentifier = "detailInformationIdentifier"
    var account: Account!
    override func viewDidLoad() {
        super.viewDidLoad()
        account = Account(1)
        tableView.delegate = self
        tableView.dataSource = self
        avatarImage.image = UIImage(named: account.avatar!)
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        nameLabel.text = account.fullName
        lateLabel.text = account.lateTime
        ageLabel.text = String(account.age!) + " лет"
        ageLabel.setNeedsDisplay()
        tableView.registerCustomCell(CustomTableViewCell.self)
    }
    
    /*
     Настройка tableView
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return account.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellIdentifier(), for: indexPath) as! CustomTableViewCell
        
        let model = account.posts[indexPath.row]
        
        cell.configure(with: model, delegate: self)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = account.posts[indexPath.row]
        performSegue(withIdentifier: fullPostIdentifier, sender: model)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fullPostIdentifier, let post = sender as? Wall {
            let destController = segue.destination as! ViewController2
            destController.post = post
            
        }
        else if segue.identifier == editIdentifier, let post = sender as? Wall {
            let destController = segue.destination as! EditorViewController
            destController.post = post
            destController.delegate = self
            
        }
        else if segue.identifier == detailInformationIdentifier, let account = sender as? Account {
            let destController = segue.destination as! fullInformationVC
            destController.account = account
        }
        
    }
    
    /*
     Действия троеточия
     */
    func didPressButton(for cell: CustomTableViewCell) {
        let didController = UIAlertController(title: "Что вы хотите сделать?", message:  nil, preferredStyle: .actionSheet)
        let editAction = UIAlertAction(title: "Редактировать", style: .default) { (UIAlertAction) in
            guard let indexPath = self.tableView.indexPath(for: cell) else{
                return
            }
            let model = self.account.posts[indexPath.row]
            self.performSegue(withIdentifier: self.editIdentifier, sender: model)
            
        }
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { (UIAlertAction) in
            guard let indexPath = self.tableView.indexPath(for: cell) else{
                return
            }
            self.account.posts.remove(at: indexPath.row)
            self.tableView.reloadData()
            
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        didController.addAction(editAction)
        didController.addAction(deleteAction)
        didController.addAction(cancelAction)
        
        self.present(didController, animated:true, completion: nil)
        
    }
    
    func didChangeText(_ post: Wall) {
        if let postValue = self.account.posts.enumerated().first(where: {$0.element.id == post.id}) {
            self.account.posts.remove(at: postValue.offset)
            self.account.posts.insert(post, at: postValue.offset)
            tableView.reloadData()
        }
    }
    
    @IBAction func pressFullInfoButton(_ sender: Any) {
        let model = self.account
        performSegue(withIdentifier: self.detailInformationIdentifier, sender: model)
        
    }
    
}

