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
        
        
        
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
    }

    
    @IBOutlet weak var backgroundImage: UIButton!
    
    @IBOutlet weak var whiteCircle: UIView!
    
    @IBAction func goToEditProfile(_ sender: Any) {
      
       
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "ProfileEditViewController") as? ProfileEditViewController{
            secondVC.profileImage = circleButton.currentBackgroundImage!
            secondVC.backgroundImage = backgroundImage.currentBackgroundImage!
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

    }
    
    func checkTheText(textField: UILabel!, temp: String?)
    {
        if temp == nil {
            textField.text = ""
        }else {
            textField.text = temp!
        }
    }
    // mypageInit 후에 이거 해야한다@@@@@@@@@@@@ 연결 문제점 - > 팟장한테 물어보기
    var tempForProfile = UIImageView()
    var tempForBackground = UIImageView()
    func textInit(){

        tempForProfile.kf.setImage(with: URL(string: gsno(myPage[0].profile_url)),placeholder: UIImage())
        tempForBackground.kf.setImage(with: URL(string: gsno(myPage[0].background_url)),placeholder: UIImage())
        
        circleButton.setBackgroundImage(tempForProfile.image, for: UIControlState.normal)
        backgroundImage.setBackgroundImage(tempForBackground.image, for: UIControlState.normal)
        checkTheText(textField: nameLabel, temp: myPage[0].name)
        checkTheText(textField: positionLabel, temp: myPage[0].position)
        checkTheText(textField: introduceLabel, temp: myPage[0].introduce)
        checkTheText(textField: emailLabel, temp: myPage[0].portfolio_url)
        checkTheText(textField: aimLabel, temp: myPage[0].aim)
        checkTheText(textField: departmentLabel, temp: myPage[0].department)
        checkTheText(textField: areaLabel, temp: myPage[0].area)
        
    }

    @IBOutlet weak var circleButton: UIButton!
    
    

    @IBAction func mainPicFunc(_ sender: UIButton) {
        mypageInit()
       textInit()
        //사진 바꾸기
    }
    
    @IBAction func profilePicFunc(_ sender: UIButton) {
        
        //사진 바꾸기
        
    }
    
    
    
    
}
