//
//  CreateViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit
import UserNotifications
class CreateViewController: UIViewController, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.tintColor = UIColor (red: 69.0/255.0, green: 182.0/255.0, blue: 255.0/255.0, alpha: 1.0)
       self.tabBarController?.tabBar.items![2].image = #imageLiteral(resourceName: "iconsTabbar3Create")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateNaviViewController")
        self.present(vc!, animated: true, completion: nil)
        let badgeCount: Int = 2
        let application = UIApplication.shared
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
            // Enable or disable features based on authorization.
        }
        application.registerForRemoteNotifications()
        application.applicationIconBadgeNumber = badgeCount
        
    }
    
    
    
    

}
