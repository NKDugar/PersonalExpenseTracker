//
//  LoginViewController.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 06/03/23.
//

import UIKit

import Combine

class LoginViewController: UIViewController {

    @objc func didTapToDismiss(){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(loginTitleLabel)
        view.addSubview(emailTextfield)
        view.addSubview(passwordTextfield)
        view.addSubview(loginButton)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToDismiss)))
//        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)

        configureConstraints()
    }
    
    private let loginTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "LogIn into your Account"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = .systemFont(ofSize: 32 , weight: .bold)
        return label
    }()
    
    private let emailTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Email"
        textfield.keyboardType = .emailAddress
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.cornerRadius = 20
        textfield.keyboardType = .emailAddress
        return textfield
    }()
    
    private let passwordTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Password"
        textfield.keyboardType = .emailAddress
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.cornerRadius = 20
        textfield.isSecureTextEntry = true
        textfield.keyboardType = .emailAddress
        return textfield
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24 , weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints  = false
        button.backgroundColor = .systemBlue
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.isEnabled = false
        return button
    }()
    
  
    private func presentAlert(with error: String){
        
        let alert = UIAlertController(title: "alert", message: error, preferredStyle: .alert)
        let okayButton = UIAlertAction(title: "Ok", style: .default)
        let delete = UIAlertAction(title: "delete" ,style: .default)
        alert.addAction(okayButton)
        alert.addAction(delete)
       present(alert, animated: true)
  
    }
    private func configureConstraints(){
        
        let loginTitleLabelConstraints = [
            loginTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ]
        
        let emailTextfieldConstraints = [
            emailTextfield.topAnchor.constraint(equalTo: loginTitleLabel.bottomAnchor, constant: 20),
            emailTextfield.heightAnchor.constraint(equalToConstant: 60),
            emailTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            emailTextfield.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            emailTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let passwordTextfieldConstraints = [
            passwordTextfield.centerXAnchor.constraint(equalTo: emailTextfield.centerXAnchor),
            passwordTextfield.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor,constant: 20),
            passwordTextfield.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            passwordTextfield.heightAnchor.constraint(equalToConstant: 60),
            passwordTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20)
        ]
        
        let loginButtonConstraints = [
            loginButton.widthAnchor.constraint(equalToConstant: 180),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            loginButton.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor,constant: 20)
        ]
        
        NSLayoutConstraint.activate(loginTitleLabelConstraints)
        NSLayoutConstraint.activate(emailTextfieldConstraints)
        NSLayoutConstraint.activate(passwordTextfieldConstraints)
        NSLayoutConstraint.activate(loginButtonConstraints)
    }
 
    
    
}

