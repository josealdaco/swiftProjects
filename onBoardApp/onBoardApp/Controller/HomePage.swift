//
//  HomePage.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 2/11/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit
import SwiftUI
class HomePage: UITabBarController{
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)

         let mainScreen = MainPageViewController()
                mainScreen.tabBarItem = UITabBarItem(title: "home", image: UIImage(named: "home"), tag: 0)
                let homeNavBar = UINavigationController(rootViewController: mainScreen)
        homeNavBar.topViewController?.title = "Home"

                let newBoxVC = NewBox()
                newBoxVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
                let newBoxNav = UINavigationController(rootViewController: newBoxVC)
                newBoxNav.topViewController?.title = "New Boxes"

                let pastBoxesVC = PastBoxes()
       
                let pastboxesNav = UINavigationController(rootViewController: pastBoxesVC)
        pastboxesNav.topViewController?.title = "History"
            pastboxesNav.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)

                let profileVC = Profile()
                let profileNavVC = UIHostingController(rootView: profileVC)
                profileNavVC.title = "Profile"
                let profileNav = UINavigationController(rootViewController:profileNavVC)
                
        profileNav.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
                
                viewControllers = [homeNavBar, newBoxNav, pastboxesNav, profileNav]
    }

}
