//
//  ProfileViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

import Kingfisher
class ProfileViewController: UIViewController {
    
    var myPage: [MyPage] = [MyPage]()
    
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
        mypageInit()
//        textInit()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
    }

    
    @IBOutlet weak var backgroundImage: UIButton!
    
    @IBOutlet weak var whiteCircle: UIView!
    
    @IBAction func goToEditProfile(_ sender: Any) {
      
       
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "ProfileEditViewController") as? ProfileEditViewController{
            secondVC.profileImage = circleButton.backgroundImage(for: UIControlState.normal)!
            secondVC.backgroundImage = backgroundImage.backgroundImage(for: UIControlState.normal)!
            secondVC.nameLabel = nameLabel.text!
            secondVC.positionLabel = positionLabel.text!
            secondVC.introduceLabel = introduceLabel.text!
            secondVC.emailLabel = emailLabel.text!
            secondVC.aimLabel = aimLabel.text!
            secondVC.departmentLabel = departmentLabel.text!
            secondVC.areaLabel = areaLabel.text!
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
    
//    MessageService.messageInit { (message) in
//
//    self.message = message
//    self.alarmTableView.reloadData()
//
//    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var introduceLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var aimLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    
    func mypageInit(){
        MypageService.myPageInit { (MyPage) in
            
            self.myPage = MyPage
            
        }
        
        /*
        
        if myPage[0].name == nil {
            nameLabel.text = ""
        }else {
            nameLabel.text = myPage[0].name!
        }

        if myPage[0].position == nil {
            positionLabel.text = ""
        }else {
            positionLabel.text = myPage[0].position!
        }

        if myPage[0].introduce == nil {
            introduceLabel.text = ""
        }else {
            introduceLabel.text = myPage[0].introduce!
        }
        if myPage[0].portfolio_url == nil {
            emailLabel.text = ""
        }else {
            emailLabel.text = myPage[0].portfolio_url!
        }
        if myPage[0].aim == nil {
            aimLabel.text = ""
        }else {
            aimLabel.text = myPage[0].aim!
        }
        if myPage[0].department == nil {
            departmentLabel.text = ""
        }else {
            departmentLabel.text = myPage[0].department!
        }
        if myPage[0].area == nil {
            areaLabel.text = ""
        }else {
            areaLabel.text = myPage[0].area!
        }
        nameLabel.text = myPage[0].name!
        positionLabel.text = myPage[0].position!
        introduceLabel.text = myPage[0].introduce!
        emailLabel.text = myPage[0].portfolio_url!
        aimLabel.text = myPage[0].aim!
        departmentLabel.text = myPage[0].department!
        areaLabel.text = myPage[0].area!

        */

    }
    
    func textInit(){
        nameLabel.text = myPage[0].name!
        positionLabel.text = myPage[0].position!
        introduceLabel.text = myPage[0].introduce!
        emailLabel.text = myPage[0].portfolio_url!
        aimLabel.text = myPage[0].aim!
        departmentLabel.text = myPage[0].department!
        areaLabel.text = myPage[0].area!
    }

    @IBOutlet weak var circleButton: UIButton!
    
    

    @IBAction func mainPicFunc(_ sender: UIButton) {
        textInit()
        //사진 바꾸기
    }
    
    @IBAction func profilePicFunc(_ sender: UIButton) {
        
        //사진 바꾸기
        
    }
    
    
    
    
}
