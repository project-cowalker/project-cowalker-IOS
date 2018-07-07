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
        self.navigationController?.isNavigationBarHidden = true
        
    
        
        
        circleButton.layer.masksToBounds = true
        circleButton.layer.cornerRadius = circleButton.layer.frame.width/2
        circleButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        circleButton.layer.borderWidth = 0.1
        whiteCircle.layer.masksToBounds = true
        whiteCircle.layer.cornerRadius = whiteCircle.layer.frame.width/2
        whiteCircle.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        whiteCircle.layer.borderWidth = 0.1
        

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBOutlet weak var whiteCircle: UIView!
    
//    var pro: [ProjectDetail] = [ProjectDetail]()
//    var temp = ""
    @IBAction func goToEditProfile(_ sender: Any) {
//        CreateNewProjectService.getProjectDeatil(project_idx: "5b3dd2387172d402215033d2") { (pro, temp) in
//            self.pro = pro
//        }
        
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "ProfileEditViewController") as? ProfileEditViewController{
//            secondVC.roleTextField.text = pro[0].title
            self.navigationController?.pushViewController(secondVC, animated: true)
            
            
            
        }
        
    }
    
    @IBAction func moreInformation(_ sender: Any) {
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "MyPageViewController") as? MyPageViewController{
            
          
            //더 보기로 이동
            
            self.navigationController?.pushViewController(secondVC, animated: true)
            
            
        }
        
    }
    
    @IBAction func logOutFunc(_ sender: UIButton) {
        let message = UIAlertController(title: "로그아웃", message: "로그아웃 하시겠습니까?", preferredStyle: .alert)
        let cancel = UIAlertAction(title:"취소", style: UIAlertActionStyle.default)
        let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default){
            (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
            
        }
        message.addAction(cancel)
        message.addAction(action)
        self.present(message, animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var circleButton: UIButton!
    
    

    @IBAction func mainPicFunc(_ sender: UIButton) {
        //사진 바꾸기
    }
    
    @IBAction func profilePicFunc(_ sender: UIButton) {
        //사진 바꾸기
        
    }
    
    
    
    
}
