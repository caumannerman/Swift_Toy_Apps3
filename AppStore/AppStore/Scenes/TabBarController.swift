//
//  TabBarController.swift
//  AppStore
//
//  Created by 양준식 on 2022/04/01.
//

import UIKit

class TabBarController: UITabBarController{
    
    //두 개의 탭에 들어갈 viewController 생성
    private lazy var todayViewController: UIViewController = {
        let viewController = TodayViewController()
        let tabBarItem =  UITabBarItem(title: "투데이", image: UIImage(systemName: "mail"), tag: 0)
        
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var appViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: AppViewController())
        let tabBarItem =  UITabBarItem(title: "앱", image: UIImage(systemName: "square.stack.3d.up"), tag: 0)
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UITabBarController는 기본적으로 viewControllers 라는 속성을 갖고있다.
        viewControllers = [todayViewController, appViewController]
    }
}
