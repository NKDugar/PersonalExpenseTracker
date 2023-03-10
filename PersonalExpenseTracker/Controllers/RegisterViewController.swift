//
//  RegisterViewController.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 06/03/23.
//


import UIKit
import Combine

class RegisterViewController: UIViewController {

    @objc func didTapToDismiss(){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor =  .systemBackground
        
        view.addSubview(registerTitleLabel)
        view.addSubview(emailTextfield)
        view.addSubview(passwordTextfield)
        view.addSubview(createAccountButton)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToDismiss)))
        
        configureConstraints()
       
    }
    
    
    private let registerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "create your Account"
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
        return textfield
    }()
    
    private let passwordTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Password"
        textfield.keyboardType = .emailAddress
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.cornerRadius = 20
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("create account", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24 , weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints  = false
        button.backgroundColor = .systemBlue
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.isEnabled = false
        return button
    }()
    
//    connecting the viewModel and the forms
    
    
    
 
//   ---
    private func presentAlert(with error: String){
        let alert = UIAlertController(title: "alert", message: error, preferredStyle: .alert)
        let okayButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okayButton)
       present(alert, animated: true)
       
    }
    
    private func configureConstraints(){
        
        let registerTitleLabelConstraints = [
            registerTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ]
        
        let emailTextfieldConstraints = [
            emailTextfield.topAnchor.constraint(equalTo: registerTitleLabel.bottomAnchor, constant: 20),
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
        
        let createAccountButtonConstraints = [
            createAccountButton.widthAnchor.constraint(equalToConstant: 180),
            createAccountButton.heightAnchor.constraint(equalToConstant: 50),
            createAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            createAccountButton.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor,constant: 20)
        ]
        
        NSLayoutConstraint.activate(registerTitleLabelConstraints)
        NSLayoutConstraint.activate(emailTextfieldConstraints)
        NSLayoutConstraint.activate(passwordTextfieldConstraints)
        NSLayoutConstraint.activate(createAccountButtonConstraints)
    }
 
}
