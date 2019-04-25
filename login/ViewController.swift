//
//  ViewController.swift
//  login
//
//  Created by Мак on 4/24/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let userName = "Denis"
    var password = "123"
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBAction func loginRecovery(_ sender: UIButton) {
         showAlert(title: "Login recovery", message: "Your Login is \(userName)")
    }
    
    @IBAction func passwordRecovery(_ sender: UIButton) {
        let alertController = UIAlertController(title:"Password reset", message:"Want to reset your password?", preferredStyle: .alert)
        let accept = UIAlertAction(title: " reset", style: .default) {
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
            showAlert(title: "Error", message: "Username and password fields can not be empty")
        }
        else if loginTextField.text!.isEmpty {
            showAlert(title: "Error", message: "Username field can not be empty")
        } else if passwordTextField.text!.isEmpty {
            showAlert(title: "Error", message: "Password field can not be empty")
        } else { if loginTextField.text! != userName || passwordTextField.text! != password {
            showAlert(title: "Error", message: "Username or password entered incorrectly")
            }
        else {
            performSegue(withIdentifier: "successLogin", sender: self)}
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.leftView?.translatesAutoresizingMaskIntoConstraints=false
        loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageView = UIImageView(image: UIImage(named: "Login-1"))
        loginTextField.leftView!.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive=true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive=true
        imageView.centerXAnchor.constraint(equalTo: loginTextField.leftView!.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: loginTextField.leftView!.centerYAnchor).isActive = true
        loginTextField.leftViewMode = .always
        loginTextField.useBottomBorderWithoutBkgColor()
        
        passwordTextField.useBottomBorderWithoutBkgColor()
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
        let action = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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

