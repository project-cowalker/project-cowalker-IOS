//
//  ProfileViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.tintColor = UIColor (red: 100.0/255.0, green: 223.0/255.0, blue: 255.0/255.0, alpha: 1.0)

        self.tabBarController?.tabBar.items![4].image = #imageLiteral(resourceName: "iconsTabbar5Mypage")
    }

    @IBAction func goToEditProfile(_ sender: Any) {
        
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "ProfileEditViewController") as? ProfileEditViewController{
            
            self.navigationController?.pushViewController(secondVC, animated: true)
            
            
        }
        
    }
    
    
    
    
    
}
