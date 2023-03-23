//
//  AddRTransactionViewController.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 15/03/23.
//

import UIKit

class AddTransaction: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor  = .systemBackground
       
        
        TopView.addSubview(titleLabel)
        TopView.addSubview(categoryImageView)
        TopView.addSubview(amountTextField)
        
        view.addSubview(TopView)
        view.addSubview(SelectCategoryButton)
        view.addSubview(walletButton)
        view.addSubview(DateButton)
        view.addSubview(noteTextField)
        
        noteTextField.addSubview(noteImageView)
        
    
        DateButton.addSubview(DateImageView)
        walletButton.addSubview(walletImageView)
        
        configureConstraints()
        
        amountTextField.tag = 1
        noteTextField.tag = 2
        amountTextField.delegate = self
        noteTextField.delegate = self
        walletButton.addTarget(self, action: #selector(WalletButtonTapped), for: .touchUpInside)
        SelectCategoryButton.addTarget(self, action: #selector(SelectCategoryButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func WalletButtonTapped(){
        print(#function)
    }
    
    @objc func SelectCategoryButtonTapped(){
        print(#function)
    }
    
    private let TopView: UIView = {
        var view = UIView()
        view.backgroundColor = .systemOrange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24)
        label.text =   "Add a transaction "
        label.textColor = .systemBackground
        label.textAlignment = .center
        return label
    }()
    
    private let categoryImageView: UIImageView = {
         let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person")
        imageView.layer.cornerRadius = 14
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.systemBackground.cgColor
        imageView.layer.borderWidth = 1
        
        return imageView
    }()
    
    private let amountTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.font = UIFont.systemFont(ofSize: 14)
        textfield.textAlignment = .center
        textfield.attributedPlaceholder = NSAttributedString(string: "Enter the amount")
//        textfield.keyboardType = .numberPad
        textfield.backgroundColor = .systemBackground
        textfield.layer.cornerRadius = 10
        textfield.textColor = .label
        return textfield
    }()
    
    private let SelectCategoryButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.setTitle("Select Category", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    private let walletImageView: UIImageView = {
         let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "creditcard")
        imageView.layer.cornerRadius = 14
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
//        imageView.layer.borderColor = UIColor.systemBackground.cgColor
//        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    private let walletButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .lightGray
        button.setTitle("Wallet", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
//        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
//        button.contentHorizontalAlignment = .left
        return button
    }()
    
    private let DateImageView: UIImageView = {
         let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "calendar")
        imageView.layer.cornerRadius = 14
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
//        imageView.layer.borderColor = UIColor.systemBackground.cgColor
//        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    private let DateButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .lightGray
        button.setTitle("Date", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
//        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
//        button.contentHorizontalAlignment = .left
        return button
    }()
    
    private let noteTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.font = UIFont.systemFont(ofSize: 14)
        textfield.textAlignment = .center
        textfield.attributedPlaceholder = NSAttributedString(string: "Write a note")
        textfield.keyboardType = .default
        textfield.backgroundColor = .systemBackground
        textfield.layer.cornerRadius = 10
        textfield.textColor = UIColor.label
        return textfield
    }()
    
    
    
    private let noteImageView: UIImageView = {
         let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "pencil")
        imageView.layer.cornerRadius = 14
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
//        imageView.layer.borderColor = UIColor.systemBackground.cgColor
//        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    func configureConstraints(){
        
        let TopViewConstraints = [
            TopView.topAnchor.constraint(equalTo: view.topAnchor,constant: 0),
            TopView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TopView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            TopView.heightAnchor.constraint(equalToConstant: 150)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: TopView.topAnchor,constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: TopView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: TopView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let categoryImageViewConstraints = [
            categoryImageView.leadingAnchor.constraint(equalTo: TopView.leadingAnchor,constant: 10),
            categoryImageView.topAnchor.constraint(equalTo: TopView.topAnchor,constant: 70),
            categoryImageView.heightAnchor.constraint(equalToConstant: 48),
            categoryImageView.widthAnchor.constraint(equalToConstant: 48)
        ]
        
        
        let amountTextFieldConstraints = [
            amountTextField.topAnchor.constraint(equalTo: categoryImageView.topAnchor,constant: 5),
            amountTextField.bottomAnchor.constraint(equalTo: categoryImageView.bottomAnchor,constant: -5),
            amountTextField.trailingAnchor.constraint(equalTo: TopView.trailingAnchor,constant: -50),
            amountTextField.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: 70)
        ]
        
        let SelectCategoryButtonConstraints = [
            SelectCategoryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 14),
            SelectCategoryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -14),
            SelectCategoryButton.heightAnchor.constraint(equalToConstant: 50),
            SelectCategoryButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -30)
        ]
        
        let walletImageViewConstraitns = [
            walletImageView.leadingAnchor.constraint(equalTo: walletButton.leadingAnchor,constant: 10),
            walletImageView.widthAnchor.constraint(equalToConstant: 40),
            walletImageView.topAnchor.constraint(equalTo: walletButton.topAnchor,constant: 2),
            walletImageView.bottomAnchor.constraint(equalTo: walletButton.bottomAnchor,constant: -2)
        ]
        
        let walletButtonConstraints = [
            walletButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 00),
            walletButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 00),
            walletButton.topAnchor.constraint(equalTo: TopView.bottomAnchor,constant: 5),
            walletButton.heightAnchor.constraint(equalToConstant: 44),
            walletButton.titleLabel!.leadingAnchor.constraint(equalTo: walletImageView.trailingAnchor,constant: 10)
        ]
        
        let DateImageViewConstraitns = [
            DateImageView.leadingAnchor.constraint(equalTo: DateButton.leadingAnchor,constant: 10),
            DateImageView.widthAnchor.constraint(equalToConstant: 40),
            DateImageView.topAnchor.constraint(equalTo: DateButton.topAnchor,constant: 2),
            DateImageView.bottomAnchor.constraint(equalTo: DateButton.bottomAnchor,constant: -2)
        ]
        
        let DateButtonConstraints = [
            DateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 00),
            DateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 00),
            DateButton.topAnchor.constraint(equalTo: walletButton.bottomAnchor,constant: 5),
            DateButton.heightAnchor.constraint(equalToConstant: 44),
            DateButton.titleLabel!.leadingAnchor.constraint(equalTo: DateImageView.trailingAnchor,constant: 10)
        ]
        
        let noteTextFieldConstraints = [
            noteTextField.topAnchor.constraint(equalTo: DateButton.bottomAnchor,constant: 5),
            noteTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            noteTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            noteTextField.heightAnchor.constraint(equalToConstant: 44)
        ]
        
        let noteImageViewConstraints = [
            noteImageView.topAnchor.constraint(equalTo: noteTextField.topAnchor,constant: 5),
            noteImageView.bottomAnchor.constraint(equalTo: noteTextField.bottomAnchor,constant: -5),
            noteImageView.widthAnchor.constraint(equalToConstant: 40),
            noteImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10)
        ]
        
        NSLayoutConstraint.activate(TopViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(categoryImageViewConstraints)
        NSLayoutConstraint.activate(amountTextFieldConstraints)
        NSLayoutConstraint.activate(SelectCategoryButtonConstraints)
        NSLayoutConstraint.activate(walletImageViewConstraitns)
        NSLayoutConstraint.activate(walletButtonConstraints)
        NSLayoutConstraint.activate(DateImageViewConstraitns)
        NSLayoutConstraint.activate(DateButtonConstraints)
        NSLayoutConstraint.activate(noteTextFieldConstraints)
        NSLayoutConstraint.activate(noteImageViewConstraints)
        
        
    }

}

extension AddTransaction: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
        textField.keyboardType = .numberPad
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
            textField.resignFirstResponder()
        }

     
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // Hide the keyboard
            textField.resignFirstResponder()
            return true
        }
    
}
