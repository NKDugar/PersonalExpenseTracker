//
//  TimeLineTableHeaderViewForSections.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 10/03/23.
//

import UIKit

class SectionHeaderLabel: UITableViewHeaderFooterView {

    static let identifier = "SectionHeaderLabel"
    weak var delegate: TimelineViewController?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
//        contentView.backgroundColor = .cyan
        contentView.addSubview(dateLable)
        contentView.addSubview(totalAmountLabel)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     var dateLable: UILabel = {
       var label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
//       label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .label
       label.text = " DATE "
       label.font = UIFont.systemFont(ofSize: 18)
//        label.backgroundColor = .systemCyan
       return label
   }()
    
     var totalAmountLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "AMOUNT"
        label.textAlignment = .right
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 18)
//        label.backgroundColor = .systemMint
        return label
    }()
   
    
    func configureConstraints(){
        
        let HeaderLabelConstraints = [
            dateLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            dateLable.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 0),
            dateLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 0)
//            if we giving any other value for bottom nchor , it is showing constraint break
            
        ]
        let totalAmountLabelConstraints = [
            totalAmountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            totalAmountLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 0),
            totalAmountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 0)
            //            if we giving any other value for bottom nchor , it is showing constraint break
        ]
        
        NSLayoutConstraint.activate(HeaderLabelConstraints)
        NSLayoutConstraint.activate(totalAmountLabelConstraints)
        
    }
    
    
}
