//
//  PageOnBoardingSlidesViewController.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 02/03/23.
//

import UIKit

class PageOnBoardingSlidesViewController: UIPageViewController {

    var pages = [UIViewController]()
    var pageControl = UIPageControl()
    var initialPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
// ------------------
        self.dataSource  = self
        self.delegate = self
// adding subview
        view.addSubview(pageControl)
        view.addSubview(TopView)
        TopView.addSubview(NextButton)
        
// calling the functions  ------------------------------------------------------------------------------------------
        setupOnBoardingSlides()
        setUpPageControl()
        configureConstraints()
// settingViewControllers ------------------------------------------------------------------------------------------
        setViewControllers([pages[initialPage]], direction: .forward, animated: true)
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)

    }
    
    
    private let NextButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.systemBlue, for: .selected)
//        button.contentMode = .scaleAspectFit
        return button
    }()
     
   
    private let TopView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
}

extension PageOnBoardingSlidesViewController{
    func configureConstraints(){
        
        pageControl.sizeToFit()
        let pageControlConstraints = [
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -30),
        ]
        
        let topViewConstraints = [
            TopView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TopView.heightAnchor.constraint(equalToConstant: 50),
            TopView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            TopView.topAnchor.constraint(equalTo: view.topAnchor,constant: 50)
        ]
       
        let nextButtonConstraints = [
            NextButton.trailingAnchor.constraint(equalTo: TopView.trailingAnchor,constant: -10),
            NextButton.heightAnchor.constraint(equalTo: TopView.heightAnchor, constant: -5),
            NextButton.topAnchor.constraint(equalTo: TopView.topAnchor,constant: 3)
        ]
        
        NSLayoutConstraint.activate(pageControlConstraints)
        NSLayoutConstraint.activate(topViewConstraints)
        NSLayoutConstraint.activate(nextButtonConstraints)
        
    }
}


extension PageOnBoardingSlidesViewController{
    
    func setupOnBoardingSlides(){
        
        let vc1 = OnBoardingSlidesViewController(ImageName: "PET - onboardingImage", TopLabelText:  "Seamlessly manage your money and budget without any financial paperwork. ", BottomLabelText: "Track your expenses anywhere, anytime. ")
        
        let vc2 = OnBoardingSlidesViewController(ImageName: "PET - onboardingImage2", TopLabelText: "Seamlessly manage your money and budget without any financial paperwork. ", BottomLabelText: "Track your expenses anywhere, anytime. ")
        
        let vc3 = OnBoardingSlidesViewController(ImageName: "PET - onboardingImage3", TopLabelText: "Seamlessly manage your money and budget without any financial paperwork. ", BottomLabelText: "Track your expenses anywhere, anytime. ")
        
        pages.append(vc1)
        pages.append(vc2)
        pages.append(vc3)
        
    }
    
    func setUpPageControl(){
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
        pageControl.pageIndicatorTintColor = .systemBackground
        pageControl.currentPageIndicatorTintColor = .white
//        pageControl.backgroundStyle = .minimal
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        pageControl.currentPage = currentIndex
        
    }
    
    @objc func pageControlTapped(_ sender: UIPageControl){
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true)
    }
    
}



extension PageOnBoardingSlidesViewController: UIPageViewControllerDelegate , UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last
        }else{
            return pages[currentIndex - 1]
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        print("11",currentIndex)
        if currentIndex == pages.count - 1 {
            return pages.first
        }else{
            return pages[currentIndex + 1]
        }
        
    }
    
}
