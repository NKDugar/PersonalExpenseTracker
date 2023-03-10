//
//  SecondSlideViewController.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 28/02/23.
//

import UIKit

class SecondSlideViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        configureConstraints()
        view.backgroundColor = .systemOrange
    }
    
    
    private let label: UILabel = {
        
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " Second slide "
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()

    
    private  func configureConstraints(){
        
        let labelConstraints = [
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 100),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 100)
        ]
        NSLayoutConstraint.activate(labelConstraints)
      
    }

}
