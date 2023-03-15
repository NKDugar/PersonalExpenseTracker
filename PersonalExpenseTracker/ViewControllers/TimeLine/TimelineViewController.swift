//
//  TimelineViewController.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 10/03/23.
//

import UIKit

class TimelineViewController: UIViewController {
    
    private let timelineTableView = UITableView(frame: .zero, style: .plain)
    
    
    
    private var cellCount = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " TIMELINE CONTROLLER "
        view.backgroundColor = .systemYellow
        
        view.addSubview(timelineTableView)
        view.addSubview(AddButton)
        AddButton.addTarget(self, action: #selector(AddButtonDidTap), for: .touchUpInside)
        configureConstraints()
        configureTimeLineTableView()
        
    }
    
    @objc func AddButtonDidTap(){
        print(" Add Button tapped ")
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
    
    private let AddButton: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 10
        button.tintColor = UIColor.white
        return button
    }()
    
    func configureTimeLineTableView(){
        timelineTableView.translatesAutoresizingMaskIntoConstraints = false
        timelineTableView.delegate = self
        timelineTableView.dataSource  = self
        timelineTableView.register(TimeLineTableViewCell.self, forCellReuseIdentifier: TimeLineTableViewCell.identifier)
        
        timelineTableView.estimatedRowHeight = 70
        timelineTableView.rowHeight = UITableView.automaticDimension
        
        timelineTableView.sectionHeaderHeight = 24
        //        timelineTableView.addSubview(chartView)
        //        timelineTableView.allowsMultipleSelection = true
        //        timelineTableView.insetsContentViewsToSafeArea  = true
        let headerView = TimeLineTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        timelineTableView.tableHeaderView = headerView

    }
    
    
    func configureConstraints(){
        
        
        let timelineTableViewConstraints = [
            //            timelineTableView.topAnchor.constraint(equalTo: chartView.bottomAnchor,constant: 5),
            timelineTableView.topAnchor.constraint(equalTo: view.topAnchor),
            timelineTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            timelineTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            timelineTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        let AddButtonConstraints = [
            AddButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100),
            AddButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            AddButton.widthAnchor.constraint(equalToConstant: 50),
            AddButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(timelineTableViewConstraints)
        NSLayoutConstraint.activate(AddButtonConstraints)
    }
    
}

extension TimelineViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellCount
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
        return 24
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index row: ",indexPath.row)
    }
   
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // deleting the cells from rows
        if editingStyle == .delete {
            print("deleting")
            tableView.beginUpdates()
            cellCount -= 1
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
            tableView.endUpdates()
            
        }
        
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

