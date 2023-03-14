//
//  InititalViewController.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 13/03/23.
//

import UIKit

class InititalViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemOrange
        configureTabBar()
        
    }
    
    func configureTabBar(){
        
       let vc1 = TimelineViewController()
        vc1.title = "name"
       let vc2 = WalletsViewController()
       let vc3 = ReportsViewController()
       let vc4 = AccountViewController()
        
        tabBar.backgroundColor = .systemBackground

        vc1.tabBarItem = UITabBarItem(title: "TimeLine", image: UIImage(systemName: "list.bullet"), tag: 0)
        vc2.tabBarItem = UITabBarItem(title: "Wallet", image: UIImage(systemName: "creditcard"), tag: 1)
        vc3.tabBarItem = UITabBarItem(title: "Reports", image: UIImage(systemName: "chart.bar.doc.horizontal"), tag: 2)
        vc4.tabBarItem = UITabBarItem(title: "Account", image: UIImage(systemName: "person"), tag: 3)
        
       setViewControllers([vc1,vc2,vc3,vc4], animated: true)
        
        vc1.tabBarItem.selectedImage = UIImage(systemName: "list.bullet")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "creditcard.fill")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "chart.bar.doc.horizontal.fill")
        vc4.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
    }

}
