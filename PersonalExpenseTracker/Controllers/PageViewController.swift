//
//  PageViewController.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 28/02/23.
//

import UIKit

class PageViewController: UIPageViewController {

    var pages =  [UIViewController]()
    var pageControl = UIPageControl()
    var initialPage = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .blue
        
        view.addSubview(pageControl)
//        addPages()
        configureConstraints()
        stylePageController()
        
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
        setViewControllers([pages[initialPage]], direction: .forward, animated: false,completion: nil)
        
        self.dataSource = self
        self.delegate = self
        
       
    }
    
    @objc func pageControlTapped(_ sender: UIPageControl) {
            setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
         
        }

}

extension PageViewController {
    
    func stylePageController(){
               pageControl.translatesAutoresizingMaskIntoConstraints = false
               pageControl.currentPageIndicatorTintColor = .black
               pageControl.pageIndicatorTintColor = .systemGray2
        
               pageControl.numberOfPages = pages.count
        
               pageControl.currentPage = initialPage
//               pageControl.backgroundColor = .systemBackground
    }
    
}

extension PageViewController: UIPageViewControllerDelegate , UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
                
                if currentIndex == 0 {
                    return pages.last               // wrap to last
                } else {
                    return pages[currentIndex - 1]  // go previous
                }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        }else {
            return pages.first
        }
        
    }
    
}

extension PageViewController{
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        print("page: ",pageViewController.viewControllers)
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
                pageControl.currentPage = currentIndex
        
    }
}



extension PageViewController{
    
    func configureConstraints(){
        let pageControlConstraints = [
            pageControl.widthAnchor.constraint(equalToConstant: 130),
            pageControl.heightAnchor.constraint(equalToConstant: 70),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
       
        
        NSLayoutConstraint.activate(pageControlConstraints)
        
    }
    
}
