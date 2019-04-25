//
//  ViewController.swift
//  login
//
//  Created by Мак on 4/24/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let userName = "denis"
    var password = "123"
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    
    @IBAction func passwordRecovery(_ sender: UIButton) {
        let alertController = UIAlertController(title:"сброс пароля", message:"хотите сбросить пароль?", preferredStyle: .alert)
        let accept = UIAlertAction(title: "sbros", style: .default) {
            action in
            self.password = "1234"
            self.showAlert(title: "new pass", message: "`your new pass is \(self.password)")
        }
        let decline = UIAlertAction(title: "decline", style: .default, handler: nil)
        
        alertController.addAction(accept)
        alertController.addAction(decline)
        
        present(alertController, animated: true, completion: nil)

        
    }
    @IBAction func signIn(_ sender: UIButton) {
        if loginTextField.text!.isEmpty && passwordTextField.text!.isEmpty {
            showAlert(title: " Ошибка", message: "Полya логин и пароль не может быть пустыми")
        }
        else if loginTextField.text!.isEmpty {
            showAlert(title: " Ошибка", message: "Поле логин не может быть пустым")
        } else if passwordTextField.text!.isEmpty {
            showAlert(title: " Ошибка", message: "Поле gfhjkm не может быть пустым")
        } else { if loginTextField.text! != userName || passwordTextField.text! != password {
            showAlert(title: " Ошибка", message: "логин или пароль введены неверно")
            }
        else {
            performSegue(withIdentifier: "successLogin", sender: self)}
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.leftView?.translatesAutoresizingMaskIntoConstraints=false
        //        loginTextField.widthAnchor.constraint(equalToConstant: 50).isActive=true
        //        loginTextField.heightAnchor.constraint(equalToConstant: 50).isActive=true
        
        loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageView = UIImageView(image: UIImage(named: "Login"))
        loginTextField.leftView!.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive=true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive=true
        imageView.centerXAnchor.constraint(equalTo: loginTextField.leftView!.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: loginTextField.leftView!.centerYAnchor).isActive = true
        loginTextField.leftViewMode = .always
        loginTextField.useBottomBorderWithoutBkgColor()
        passwordTextField.useBottomBorderWithoutBkgColor()
        //        imageView.trailingAnchor.constraint(equalTo: loginTextField.leadingAnchor, constant: -40)
        
        // Do any additional setup after loading the view.
        // password
        passwordTextField.leftView?.translatesAutoresizingMaskIntoConstraints=false
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let passwordImageView = UIImageView(image: UIImage(named: "password"))
        passwordTextField.leftViewMode = .always
        passwordTextField.leftView!.addSubview(passwordImageView)
        passwordImageView.translatesAutoresizingMaskIntoConstraints = false
        passwordImageView.widthAnchor.constraint(equalToConstant: 20).isActive=true
        passwordImageView.heightAnchor.constraint(equalToConstant: 20).isActive=true
        passwordImageView.centerXAnchor.constraint(equalTo: passwordTextField.leftView!.centerXAnchor).isActive = true
        passwordImageView.centerYAnchor.constraint(equalTo: passwordTextField.leftView!.centerYAnchor).isActive = true
        
        
        
        
    }
    
    func showAlert(title: String, message: String){
        let alertController = UIAlertController(title:title, message:  message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
}

extension UITextField {
    
    func useBottomBorderWithoutBkgColor() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

