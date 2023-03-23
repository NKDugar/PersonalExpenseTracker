//
//  TimeLienableViewNavigationView.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 14/03/23.
//

import UIKit

class TimeLineTableHeaderView: UIView {

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemYellow
        
        addSubview(AllWalletsButton)
        addSubview(AllHistoryButton)
        addSubview(SpendingOverviewButton)
        SpendingOverviewButton.addSubview(SpendingOverviewImageView)
        
        AllWalletsButton.addTarget(self, action: #selector(AllWalletsButtonTapped), for: .touchUpInside)
        AllHistoryButton.addTarget(self, action: #selector(AllHistoryButtonTapped), for: .touchUpInside)
        SpendingOverviewButton.addTarget(self, action: #selector(SpendingOverviewButtonTapped), for: .touchUpInside)
        
        configureConstraints()
      
    }
    
  
    
    @objc func AllWalletsButtonTapped(){
        print(#function)
    }
    
    @objc func AllHistoryButtonTapped(){
        print(#function)
    }
    
    @objc func SpendingOverviewButtonTapped(){
        print(#function)
    }
    
    
    private let AllWalletsButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("All Wallets", for: .normal)
        button.backgroundColor = UIColor.cyan
        button.layer.cornerRadius = 10
        button.tintColor = UIColor.secondarySystemBackground
        button.contentMode = .scaleAspectFit
        button.setTitleColor(UIColor.label, for: .normal)
        return button
    }()
    
    private let AllHistoryButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("All History", for: .normal)
        button.backgroundColor = UIColor.cyan
        button.layer.cornerRadius = 10
        button.tintColor = UIColor.secondarySystemBackground
        button.contentMode = .scaleAspectFit
        button.setTitleColor(UIColor.label, for: .normal)
        return button
    }()
    
    private let SpendingOverviewImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "pencil")
        imageView.frame = CGRect(x: 0, y: 0, width: 30 , height: 30)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    private let SpendingOverviewButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Spending Overview", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.backgroundColor = UIColor.cyan
        button.layer.cornerRadius = 20
        button.tintColor = UIColor.systemBlue
        button.contentMode = .scaleAspectFit
        
        return button
    }()
    
    func configureConstraints(){
        
        let AllWalletsButtonConstraints = [
            AllWalletsButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 5),
            AllWalletsButton.widthAnchor.constraint(equalToConstant: 100),
            AllWalletsButton.heightAnchor.constraint(equalToConstant: 30),
            AllWalletsButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 110)
        ]
        
        let AllHistoryButtonConstraints = [
            AllHistoryButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 5),
            AllHistoryButton.widthAnchor.constraint(equalToConstant: 100),
            AllHistoryButton.heightAnchor.constraint(equalToConstant: 30),
            AllHistoryButton.leadingAnchor.constraint(equalTo: AllWalletsButton.trailingAnchor, constant: 10)
        ]
        
        let SpendingOverviewButtonConstraints = [
            SpendingOverviewButton.leadingAnchor.constraint(equalTo: AllWalletsButton.leadingAnchor),
            SpendingOverviewButton.trailingAnchor.constraint(equalTo: AllHistoryButton.trailingAnchor),
            SpendingOverviewButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -15),
            SpendingOverviewButton.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let spendingOverViewImageViewConstraints = [
            SpendingOverviewImageView.topAnchor.constraint(equalTo: SpendingOverviewButton.topAnchor),
            SpendingOverviewImageView.bottomAnchor.constraint(equalTo: SpendingOverviewButton.bottomAnchor, constant: 0),
            SpendingOverviewImageView.leadingAnchor.constraint(equalTo: SpendingOverviewButton.leadingAnchor,constant: 5)
        ]
        
        
        NSLayoutConstraint.activate(AllWalletsButtonConstraints)
        NSLayoutConstraint.activate(AllHistoryButtonConstraints)
        NSLayoutConstraint.activate(SpendingOverviewButtonConstraints)
        NSLayoutConstraint.activate(spendingOverViewImageViewConstraints)
    }
    
}
