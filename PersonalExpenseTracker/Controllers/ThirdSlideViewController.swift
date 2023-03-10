//
//  ThirdSlideViewController.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 02/03/23.
//

import UIKit

class ThirdSlideViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        view.addSubview(label)
        configureConstraints()
    }
    
    private let label: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32)
        label.text = "third slide"
        
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
