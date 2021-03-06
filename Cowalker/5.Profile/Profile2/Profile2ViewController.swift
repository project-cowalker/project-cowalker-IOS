//
//  Profile2ViewController.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 10..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class Profile2ViewController: UIViewController {

    @IBOutlet weak var whiteView: UIView!
    
    @IBOutlet weak var backgroundImage: UIButton!
    @IBOutlet weak var profileImage: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var purposeLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    
    @IBOutlet weak var areaLabel: UILabel!
    
    
    var user_idx: Int = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        whiteView.layer.masksToBounds = true
        whiteView.layer.cornerRadius = whiteView.layer.frame.width/2
        whiteView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        whiteView.layer.borderWidth = 0.1
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.layer.frame.width/2
        profileImage.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        profileImage.layer.borderWidth = 0.1
        mypageInit()
        print(user_idx)
        funcForNavigationBar()
        // Do any additional setup after loading the view.
    }
    func funcForNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "타인의 마이페이지"
        let leftButtonItem = UIBarButtonItem(image: UIImage(named: "iconCaretLeftDarkgray"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(Profile2ViewController.popAction))
        leftButtonItem.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = leftButtonItem
    }
    @objc func popAction() {
        self.navigationController?.popViewController(animated: true)
    }
   
    
        
        
    
    
    var myPage: [OtherMyPage] = [OtherMyPage]()
    func mypageInit(){
        MypageService.otherMyPageInit(tempUrl: "/"+String(user_idx)) { (MyPage) in
            
            self.myPage = MyPage
            self.textInit() // 다른 뷰에 다 체크
            
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
        profileImage.kf.setBackgroundImage(with: URL(string: gsno(myPage[0].profile_url)), for: .normal, placeholder: UIImage(named: "imgProfileDefault"))
        backgroundImage.kf.setBackgroundImage(with: URL(string: gsno(myPage[0].background_url)), for: .normal, placeholder: UIImage(named: "imgCoverDefault"))
        
//        tempForProfile.kf.setImage(with: URL(string: gsno(myPage[0].profile_url)),placeholder:#imageLiteral(resourceName: "cowalker.png") )
//        tempForBackground.kf.setImage(with: URL(string: gsno(myPage[0].background_url)),placeholder: #imageLiteral(resourceName: "cowalker.png"))
//
//        profileImage.setBackgroundImage(tempForProfile.image, for: UIControlState.normal)
//        backgroundImage.setBackgroundImage(tempForBackground.image, for: UIControlState.normal)
        checkTheText(textField: nameLabel, temp: myPage[0].name)
        checkTheText(textField: positionLabel, temp: myPage[0].position)
        checkTheText(textField: commentLabel, temp: myPage[0].introduce)
        checkTheText(textField: emailLabel, temp: myPage[0].portfolio_url)
        checkTheText(textField: purposeLabel, temp: myPage[0].aim)
        checkTheText(textField: departmentLabel, temp: myPage[0].department)
        checkTheText(textField: areaLabel, temp: myPage[0].area)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func pushToProject(_ sender: Any) {
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "ProfileProjectViewController") as? ProfileProjectViewController{
            secondVC.user_idx = user_idx
            
            self.navigationController?.pushViewController(secondVC, animated: true)
            
            
        }
        
    }
    
    @IBAction func moreInformation(_ sender: Any) {
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "GetMoreInformationViewController") as? GetMoreInformationViewController{

            secondVC.user_idx = user_idx

            self.navigationController?.pushViewController(secondVC, animated: true)


        }
//        let storyboard: UIStoryboard = UIStoryboard(name: "Profile2", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "GetMoreInformationViewController") as! GetMoreInformationViewController
//        //        vc.tempProjectId = temp
//        vc.user_idx = user_idx
//        self.present(vc, animated: true,completion: nil)
        
    }
    
    @IBAction func sendingMessageToOthers(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Alarm", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SendingMessageViewController") as! SendingMessageViewController
//        vc.tempProjectId = temp
        vc.partner_idx = user_idx
        self.present(vc, animated: true,completion: nil)
        
        
        
        
        
    }
    
    
    

}
