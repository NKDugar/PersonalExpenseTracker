//
//  FirstSlideViewController.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 28/02/23.
//

import UIKit

class FirstSlideViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(label)
        configureConstraints()
        view.backgroundColor = .systemPink
    }
    
    private let label: UILabel = {
       
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " First slide "
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()

    
    private let imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "pencil")
        return imageView
    }()
    
    private  func configureConstraints(){
        
        let imageViewConstraints = [
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            imageView.widthAnchor.constraint(equalToConstant: 50)
        ]
        
        let labelConstraints = [
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 100),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 100)
        ]
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(imageViewConstraints)
        
        
    }

}
