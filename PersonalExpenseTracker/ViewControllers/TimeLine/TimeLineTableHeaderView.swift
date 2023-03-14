//
//  TimeLineTableHeaderView.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 10/03/23.
//

import UIKit

class TimeLineTableHeaderView: UITableViewHeaderFooterView {
    
    static  let identifier = "HeaderForTimeLineTableView"
    weak var delegate: TimelineViewController?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(TimeLineTableHeaderLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     let TimeLineTableHeaderLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
         label.textColor = .label
        label.text = " TRANSACTIONS "
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    func configureConstraints(){
        let TimeLineTableHeaderLabelConstraints = [
            TimeLineTableHeaderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
            TimeLineTableHeaderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            TimeLineTableHeaderLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            TimeLineTableHeaderLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8)
        ]
        
        NSLayoutConstraint.activate(TimeLineTableHeaderLabelConstraints)
        
    }
    
    
}
