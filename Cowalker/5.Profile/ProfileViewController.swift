//
//  ProfileViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

import Kingfisher
class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
        imagePicker.delegate = self
        imagePickerForProfile.delegate = self
        
        
        
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        mypageInit()
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
    @IBOutlet weak var numOfSeeds: UILabel!
    
    func mypageInit(){
        MypageService.myPageInit(tempUrl: "") { (MyPage) in
            
            self.myPage = MyPage
            self.textInit() // 다른 뷰에 다 체크
            print(self.myPage[0].profile_url!)
            
            
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
        
     
        checkTheText(textField: nameLabel, temp: myPage[0].name)
        checkTheText(textField: positionLabel, temp: myPage[0].position)
        checkTheText(textField: introduceLabel, temp: myPage[0].introduce)
        checkTheText(textField: emailLabel, temp: myPage[0].portfolio_url)
        checkTheText(textField: aimLabel, temp: myPage[0].aim)
        checkTheText(textField: departmentLabel, temp: myPage[0].department)
        checkTheText(textField: areaLabel, temp: myPage[0].area)
        tempForProfile.kf.setImage(with: URL(string: gsno(myPage[0].profile_url)),placeholder: #imageLiteral(resourceName: "1.png"))
        tempForBackground.kf.setImage(with: URL(string: gsno(myPage[0].background_url)),placeholder: #imageLiteral(resourceName: "1.png"))
        
        circleButton.setBackgroundImage(tempForProfile.image, for: UIControlState.normal)
        backgroundImage.setBackgroundImage(tempForBackground.image, for: UIControlState.normal)
        if myPage[0].point != 0 {
            numOfSeeds.text = String(myPage[0].point)+" 개"
        }
        
    }

    @IBOutlet weak var circleButton: UIButton!
    
    
//    secondVC.profileImage = circleButton.currentBackgroundImage!
//    secondVC.backgroundImage = backgroundImage.currentBackgroundImage!
//    secondVC.nameLabel = nameLabel.text!
//    secondVC.positionLabel = positionLabel.text!
//    secondVC.introduceLabel = introduceLabel.text!
//    secondVC.emailLabel = emailLabel.text!
//    secondVC.aimLabel = aimLabel.text!
//    secondVC.departmentLabel = departmentLabel.text!
//    secondVC.areaLabel = areaLabel.text!
    @IBAction func mainPicFunc(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
        if imageForMyPage != nil {
            MypageService.myPageEdit(profile_img: circleButton.currentBackgroundImage!, background_img: imageForMyPage!, name: nameLabel.text!, position: positionLabel.text!, introduce: introduceLabel.text!, portfolio_url: emailLabel.text!, aim: aimLabel.text!, department: departmentLabel.text!, area: areaLabel.text!) { (message) in
                if message == "update success"{
                    print("success")
                    self.mypageInit()
                }
        }
        
        }
        
        //사진 바꾸기
    }
    
    @IBAction func profilePicFunc(_ sender: UIButton) {
        imagePickerForProfile.allowsEditing = false
        imagePickerForProfile.sourceType = .photoLibrary
        self.present(imagePickerForProfile, animated: true, completion: nil)
        //사진 바꾸기
        if imageForProfile != nil {
            MypageService.myPageEdit(profile_img: imageForProfile!, background_img: backgroundImage.currentBackgroundImage!, name: nameLabel.text!, position: positionLabel.text!, introduce: introduceLabel.text!, portfolio_url: emailLabel.text!, aim: aimLabel.text!, department: departmentLabel.text!, area: areaLabel.text!) { (message) in
                if message == "update success"{
                    print("success")
                    self.mypageInit()
                }
            }
            
        }
        
    }
    let imagePicker = UIImagePickerController()
    let imagePickerForProfile = UIImagePickerController()

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        self.dismiss(animated: true)
    }
   
    
    var imageForMyPage: UIImage?
    var imageForProfile: UIImage?
    
  
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if picker == imagePicker {
            if let selectedImage: UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
                
                imageForMyPage = selectedImage
                
            }
        }else {
            if let selectedImage: UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
                
                imageForProfile = selectedImage
            }
        }
        
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
