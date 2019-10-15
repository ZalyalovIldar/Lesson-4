//
//  ViewController.swift
//  DynamicTable
//
//  Created by Ильдар Залялов on 09/10/2019.
//  Copyright © 2019 Ildar Zalyalov. All rights reserved.
//

import UIKit

enum Emails: String {
    case email1 = "mail1@mail.ru"
    case email2 = "mail2@mail.ru"
    case email3 = "mail3@mail.ru"
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var textFields: [UITextField] = []
    
    var users = [User(email: Emails.email1.rawValue,
                      password: "user01",
                      name: "Amir Mardanov",
                      age: 18,
                      city: "Kazan",
                      photo: "profile",
                      status: "ALLLLL",
                      birthday: "15 октября 2000 г.",
                      university: "КФУ (бывш. КГУ им. Ульянова-Ленина)",
                      faculty: "Высшая школа информационных технологий и интеллектульных систем",
                      schoolName: "IT-лицей КФУ '18",
                      schoolCity: "Казань",
                      schoolYears: "2014-2018",
                      languages: "Русский, English",
                      vkId: "omeeer78",
                      instagramName: "omeeer78",
                      phone: "79991553468",
                      gifts: [UIImage(named: "gift1")!,
                              UIImage(named: "gift2")!],
                      firstCompanyName: "Flatstack",
                      firstCompanyInfo: "Казань, 2020-2022",
                      firstCompanyPosition: "iOS Developer",
                      secondCompanyName: "Apple",
                      secondCompanyInfo: "Cupertino, с 2022 г.",
                      secondCompanyPosition: "CEO"),
                 User(email: Emails.email2.rawValue,
                      password: "user02",
                      name: "Tim Cook",
                      age: 58,
                      city: "Cupertino",
                      photo: "profile2",
                      status: "Make Apple great again",
                      birthday: "1 ноября 19600 г.",
                      university: "КФУ (бывш. КГУ им. Ульянова-Ленина)",
                      faculty: "Высшая школа информационных технологий и интеллектульных систем",
                      schoolName: "IT-лицей КФУ '18",
                      schoolCity: "Казань",
                      schoolYears: "2014-2018",
                      languages: "Русский, English, Татарча",
                      vkId: "cook60",
                      instagramName: "cook60",
                      phone: "79991553468",
                      gifts: [UIImage(named: "gift1")!,
                              UIImage(named: "gift2")!],
                      firstCompanyName: "Flatstack",
                      firstCompanyInfo: "Казань, 2010-2011",
                      firstCompanyPosition: "iOS Developer",
                      secondCompanyName: "Apple",
                      secondCompanyInfo: "Cupertino, с 2011 г.",
                      secondCompanyPosition: "CEO"),
                 User(email: Emails.email3.rawValue,
                      password: "user03",
                      name: "Filipp Kirkorov",
                      age: 52,
                      city: "Sofia",
                      photo: "profile4",
                      status: "Цвет настроения синий",
                      birthday: "30 апреля 1967 г.",
                      university: "КФУ (бывш. КГУ им. Ульянова-Ленина)",
                      faculty: "Высшая школа информационных технологий и интеллектульных систем",
                      schoolName: "IT-лицей КФУ '18",
                      schoolCity: "Казань",
                      schoolYears: "2014-2018",
                      languages: "Русский, English, Болгарский",
                      vkId: "fkirkorov",
                      instagramName: "fkirkorov",
                      phone: "79991553469",
                      gifts: [UIImage(named: "gift1")!,
                              UIImage(named: "gift2")!],
                      firstCompanyName: "Болгарская консерватория",
                      firstCompanyInfo: "Болгария, 2010-2011",
                      firstCompanyPosition: "Певец",
                      secondCompanyName: "ИП Киркоров",
                      secondCompanyInfo: "Москва, с 2011 г.",
                      secondCompanyPosition: "Глава тупа")]
    
    private func getPosts(for user: User) -> [Post] {
        
        var posts = [Post]()
        
        switch user.email {
            
        case Emails.email1.rawValue:
            posts.append(Post(text: "Only text for \(user.email)", image: nil, time: "10 минут назад"))
            posts.append(Post(text: "Text with image for \(user.email)", image: UIImage(named: "profile3")!, time: "20 минут назад"))
            posts.append(Post(text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderi in voluptate velit esse cilum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: UIImage(named: "profile3")!, time: "40 минут назад"))
        case Emails.email2.rawValue:
            posts.append(Post(text: "Only text for \(user.email)", image: UIImage(named: "profile3")!, time: "10 минут назад"))
            posts.append(Post(text: "Text with image for \(user.email)", image: UIImage(named: "profile3")!, time: "20 минут назад"))
            posts.append(Post(text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderi in voluptate velit esse cilum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: UIImage(named: "profile3")!, time: "40 минут назад"))
        case Emails.email3.rawValue:
            posts.append(Post(text: "Only text for \(user.email)", image: UIImage(named: "profile3")!, time: "10 минут назад"))
            posts.append(Post(text: "Text with image for \(user.email)", image: UIImage(named: "profile3")!, time: "20 минут назад"))
            posts.append(Post(text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderi in voluptate velit esse cilum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: UIImage(named: "profile3")!, time: "40 минут назад"))
        default:
            posts = []
        }
        return posts
    }
    
    var userModel: User!
    
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                      NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 17)!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFields.append(loginTextField)
        textFields.append(passwordTextField)
        
        setupUI()
    }
    
    private func setupUI() {
        
        loginTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        passwordTextField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        
        for textField in textFields {
            
            textField.clipsToBounds = true
            textField.layer.cornerRadius = 8
            
            let placeholderPadding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
            
            textField.leftView = placeholderPadding
            textField.leftViewMode = UITextField.ViewMode.always
        }
        
        loginTextField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                                  attributes: attributes)
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Пароль",
                                                                     attributes: attributes)
    }
    
    func showWarningAlert(message: String) {
        
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Понял, сейчас исправлю", style: .destructive, handler: nil)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        guard let email = loginTextField.text, let password = passwordTextField.text else { return }
        
        if !validateEmail(email: email) {
            if !validatePassword(with: password) {
                showWarningAlert(message: "Пароль должен состоять из букв и цифр и содержать минимум 6 символов")
                return
            }
            showWarningAlert(message: "Email не найден")
            return
        } else {
            
            guard let user = users.first(where: {$0.email == loginTextField.text && $0.password == passwordTextField.text} ) else {
                showWarningAlert(message: "Пользователь не найден")
                return
            }
            userModel = user
        }
        
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail", let destVC = segue.destination as? MainPageController {
            
            destVC.user = userModel
            destVC.posts = getPosts(for: userModel)
        }
    }
    
    func validatePassword(with text: String) -> Bool {
        
        let decimals = CharacterSet.decimalDigits
        let decimalRange = text.rangeOfCharacter(from: decimals)
        
        let letters = CharacterSet.letters
        let lettersRange = text.rangeOfCharacter(from: letters)
        
        return text.count >= 6 && decimalRange != nil && lettersRange != nil
        
    }
    
    func validateEmail(email :String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
