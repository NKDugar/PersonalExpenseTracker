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
        contentView.addSubview(chartView)
//        contentView.addSubview(lable)
        chartView.addSubview(lable)
        
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
    
    
    private let chartView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        view.contentMode = .center
        return view
    }()
    
    private let lable: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = " CHART VIEW "
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .justified
        return label
    }()
    
    func configureConstraints(){
        let TimeLineTableHeaderLabelConstraints = [
            TimeLineTableHeaderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
            TimeLineTableHeaderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            TimeLineTableHeaderLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            TimeLineTableHeaderLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8)
        ]
        
        let chartViewConstraints = [
            chartView.topAnchor.constraint(equalTo: contentView.topAnchor),
            

        ]
        
        let labelConstraints = [
            lable.centerXAnchor.constraint(equalTo: chartView.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(chartViewConstraints)
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(TimeLineTableHeaderLabelConstraints)
        
    }
    
    
}
