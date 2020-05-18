//
//  HomeViewController.swift
//  testlogin
//
//  Created by Nguyen Anh Tu on 5/19/20.
//  Copyright © 2020 Nguyen Anh Tu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let tabBar = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabbar()
        // Do any additional setup after loading the view.
    }
    
    func createTabbar () {
        let homeVC = UIViewController()
        homeVC.view.backgroundColor = .red
        let settingVC = UIViewController()
        settingVC.view.backgroundColor = .green
        
        let homeItem = UITabBarItem(title: "Home", image: nil, tag: 1)
        let settingItem = UITabBarItem(title: "Setting", image: nil, tag: 2)
        
        homeVC.tabBarItem = homeItem
        settingVC.tabBarItem = settingItem
        
        tabBar.viewControllers = [homeVC,settingVC]
        self.view.addSubview(tabBar.view)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
