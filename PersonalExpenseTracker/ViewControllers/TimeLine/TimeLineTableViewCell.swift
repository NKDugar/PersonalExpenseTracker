//
//  TimeLineTableViewCell.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 10/03/23.
//

import UIKit

class TimeLineTableViewCell: UITableViewCell {
    
    static let identifier = "TimeLineTableViewCell"
    weak var delegate: TimelineViewController?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(categoryImage)
        contentView.addSubview(categoryNameLabel)
        contentView.addSubview(walletTypeLabel)
        contentView.addSubview(walletCategoryImage)
        contentView.addSubview(amountLabel)
        //        contentView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        configureConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let categoryImage: UIImageView = {
        var imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = UIImage(systemName: "house")
        imageview.layer.cornerRadius = 10
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    var categoryNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        //        label.text = " CategoryName "
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 24)
        label.sizeToFit()
        return label
    }()
    
    var walletTypeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 24)
        //        label.text = "Cash"
        label.sizeToFit()
        return label
    }()
    
    private let walletCategoryImage: UIImageView = {
        var imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = UIImage(systemName: "creditcard")
        imageview.layer.cornerRadius = 5
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    
    private let amountLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = "+₹ 500"
        label.sizeToFit()
        return label
    }()
    
    
    func configureConstraints(){
        
        let categoryImageConstraints = [
            categoryImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            categoryImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            categoryImage.heightAnchor.constraint(equalTo: contentView.heightAnchor,constant: -24),
            categoryImage.widthAnchor.constraint(equalTo: contentView.heightAnchor,constant: -24)
        ]
        
        let categoryNameLabelConstraints = [
            categoryNameLabel.leadingAnchor.constraint(equalTo: categoryImage.trailingAnchor,constant: 16),
            categoryNameLabel.topAnchor.constraint(equalTo: categoryImage.topAnchor),
            categoryNameLabel.heightAnchor.constraint(equalToConstant: contentView.frame.size.height / 2)
        ]
        
        let walletCategoryImageConstraints = [
            walletCategoryImage.leadingAnchor.constraint(equalTo: categoryImage.trailingAnchor,constant: 16),
            walletCategoryImage.widthAnchor.constraint(equalToConstant: 20),
            walletCategoryImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            walletCategoryImage.topAnchor.constraint(equalTo: categoryNameLabel.bottomAnchor,constant: 5)
        ]
        
        let walletTypeLabelConstraints = [
            walletTypeLabel.leadingAnchor.constraint(equalTo: walletCategoryImage.trailingAnchor,constant: 16),
            walletTypeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            walletTypeLabel.topAnchor.constraint(equalTo: categoryNameLabel.bottomAnchor,constant: 5)
        ]
        
        let amountLabelConstraints = [
            amountLabel.topAnchor.constraint(equalTo: categoryImage.topAnchor),
            amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            
        ]
        
        NSLayoutConstraint.activate(categoryImageConstraints)
        NSLayoutConstraint.activate(categoryNameLabelConstraints)
        NSLayoutConstraint.activate(walletTypeLabelConstraints)
        NSLayoutConstraint.activate(walletCategoryImageConstraints)
        NSLayoutConstraint.activate(amountLabelConstraints)
        
    }
    
}
