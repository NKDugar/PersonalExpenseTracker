//
//  TimelineViewController.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 10/03/23.
//

import UIKit

class TimelineViewController: UIViewController {

    private let timelineTableView = UITableView(frame: .zero, style: .plain)

    private let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " TIMELINE CONTROLLER"
        view.backgroundColor = .systemYellow
        chartView.addSubview(lable)
        
        view.addSubview(navigationBar)
        view.addSubview(chartView)
        view.addSubview(timelineTableView)
//        view.addSubview(scrollView)
//      configureScrollView()
        configureConstraints()
        configureTimeLineTableView()

    }
  
    func configureScrollView(){
        
        scrollView.frame = view.bounds
        scrollView.addSubview(navigationBar)
        scrollView.addSubview(chartView)
        scrollView.addSubview(timelineTableView)
        scrollView.contentSize = CGSize(width: 1000, height: 1000)
        
    }

    
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
    
    private let  navigationBar: UINavigationBar = {
        var navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints  = false
        navigationBar.backgroundColor = .systemRed
        navigationBar.tintColor = .label
        return navigationBar
    }()
    

    
   
    
    func configureTimeLineTableView(){
        timelineTableView.translatesAutoresizingMaskIntoConstraints = false
        timelineTableView.delegate = self
        timelineTableView.dataSource  = self
        timelineTableView.register(TimeLineTableViewCell.self, forCellReuseIdentifier: TimeLineTableViewCell.identifier)
       
        timelineTableView.estimatedRowHeight = 70
        timelineTableView.rowHeight = UITableView.automaticDimension
        timelineTableView.tableHeaderView = TimeLineTableHeaderView()
        timelineTableView.sectionHeaderHeight = 24
//        timelineTableView.addSubview(chartView)
//        timelineTableView.allowsMultipleSelection = true
//        timelineTableView.insetsContentViewsToSafeArea  = true
    }
    
    
    func configureConstraints(){
        
        let chartViewConstraints = [
            chartView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor,constant: 5),
            chartView.heightAnchor.constraint(equalToConstant: 0.25*(view.frame.height)),
            chartView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        let labelConstraints = [
            lable.centerXAnchor.constraint(equalTo: chartView.centerXAnchor)
        ]
        
        let timelineTableViewConstraints = [
            timelineTableView.topAnchor.constraint(equalTo: chartView.bottomAnchor,constant: 5),
            timelineTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            timelineTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            timelineTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        let navigationBarConstraints = [
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 44)
        ]
        
        NSLayoutConstraint.activate(chartViewConstraints)
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(timelineTableViewConstraints)
        NSLayoutConstraint.activate(navigationBarConstraints)
    }
    
}

extension TimelineViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TimeLineTableViewCell.identifier, for: indexPath) as! TimeLineTableViewCell
//        cell.delegate = self
        cell.categoryNameLabel.text = "Naveen"
        cell.walletTypeLabel.text = "Cash"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = SectionHeaderLabel(reuseIdentifier: SectionHeaderLabel.identifier)
//        header.delegate = self
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index row: ",indexPath.row)
    }
    
}

extension TimelineViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      
       
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let y = timelineTableView.contentOffset
        print("content off set ",y)
        let x = timelineTableView.contentInset
        print("conetnt on set ",x)
    }
    
    
    
}

