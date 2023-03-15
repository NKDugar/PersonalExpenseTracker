//
//  TimeLineTableHeaderView.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 10/03/23.
//

import UIKit

class TimeLineTableHeaderView1: UITableViewHeaderFooterView {
    
    static  let identifier = "HeaderForTimeLineTableView"
    static var viewHeight: CGFloat?
//    navigation
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
       contentView.backgroundColor = .systemPink
        contentView.addSubview(chartView)
        contentView.addSubview(lable)
        configureConstraints()
        TimeLineTableHeaderView1.viewHeight = contentView.frame.size.height
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let chartView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemMint
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
        
        let chartViewConstraints = [
            chartView.topAnchor.constraint(equalTo: contentView.topAnchor),
            chartView.heightAnchor.constraint(equalToConstant: 300),
            chartView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            chartView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        
        let labelConstraints = [
            lable.centerXAnchor.constraint(equalTo: chartView.centerXAnchor),
            lable.centerYAnchor.constraint(equalTo: chartView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(chartViewConstraints)
        NSLayoutConstraint.activate(labelConstraints)
    }
    
}
