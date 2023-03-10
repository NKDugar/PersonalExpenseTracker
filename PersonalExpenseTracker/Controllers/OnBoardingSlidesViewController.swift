//
//  OnBoardingSlidesViewController.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 02/03/23.
//

import UIKit

class OnBoardingSlidesViewController: UIViewController {

    var ImageName: String?
    var TopLabelText: String?
    var BottomLabelText: String?
    
     init(ImageName: String?, TopLabelText: String?, BottomLabelText: String?) {
        self.ImageName = ImageName
        self.TopLabelText = TopLabelText
        self.BottomLabelText = BottomLabelText
         super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        setup()
    }
    
    func setup() {
        
            let topLabel = UILabel()
            topLabel.translatesAutoresizingMaskIntoConstraints = false
            topLabel.text = TopLabelText
            topLabel.font = UIFont.systemFont(ofSize: 18)
            topLabel.numberOfLines = 0
            topLabel.backgroundColor = .secondaryLabel
        
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            guard let ImageName = ImageName else{ return  }
            imageView.image = UIImage(named: ImageName)
        
        
            let bottomLabel = UILabel()
            bottomLabel.translatesAutoresizingMaskIntoConstraints = false
            bottomLabel.text = BottomLabelText
            bottomLabel.font = UIFont.systemFont(ofSize: 18)
            bottomLabel.numberOfLines = 0
            bottomLabel.backgroundColor = .secondaryLabel
            
//        addingSubView
        view.addSubview(topLabel)
        view.addSubview(imageView)
        view.addSubview(bottomLabel)
        
//        setting constraints
        
        let topLabelConstraints = [
            topLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 250),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            topLabel.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        
        let ImageViewConstraints = [
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            imageView.topAnchor.constraint(equalTo: topLabel.bottomAnchor,constant: 10),
            imageView.heightAnchor.constraint(equalToConstant: 350)
        ]
       
        let bottomLabelConstraints = [
            bottomLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 10),
            bottomLabel.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor),
            bottomLabel.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor),
            bottomLabel.heightAnchor.constraint(equalToConstant: 50)
        ]
        
       
        NSLayoutConstraint.activate(ImageViewConstraints)
        NSLayoutConstraint.activate(topLabelConstraints)
        NSLayoutConstraint.activate(bottomLabelConstraints)
        
       // line before function ends
    }
    
    
}
