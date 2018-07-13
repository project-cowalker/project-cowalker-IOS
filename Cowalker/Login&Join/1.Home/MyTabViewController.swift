//
//  MyTabViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class MyTabViewController: UITabBarController {

    @IBOutlet weak var tabBarImg: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarImg.items![1].image = #imageLiteral(resourceName: "iconsTabbar2Search")
        tabBarImg.items![2].image = #imageLiteral(resourceName: "iconsTabbar3Create")
        tabBarImg.items![3].image = #imageLiteral(resourceName: "iconsTabbar4Alarm")
        tabBarImg.items![4].image = #imageLiteral(resourceName: "iconsTabbar5Mypage")
    }
}
