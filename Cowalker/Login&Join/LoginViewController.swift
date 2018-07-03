//
//  LoginViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//
import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var idTf: UITextField!
    @IBOutlet weak var pwTf: UITextField!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var loginBtn: UIButton!
    
    // 자동로그인 기능
    let userdefault = UserDefaults.standard
    var autoLogin = false
    
    @IBOutlet weak var loginCheckImg: UIImageView!
    var uid:String!
    var password:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginCheckImg.isHidden = true
        autoLogin = false
        /*
         if let userId = userdefault.string(forKey: "email"){
         self.logInit()
         }*/
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // tf 라인 색 변화
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == idTf {
            view1.backgroundColor = UIColor(red: 100.0/255.0, green: 223.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            
        }else{
            view2.backgroundColor = UIColor(red: 100.0/255.0, green: 223.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if textField == idTf {
            if idTf.text == ""{
                view1.backgroundColor = UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1.0)}
        }else{
            if pwTf.text == ""{
                view2.backgroundColor = UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1.0)}}
        }
    
    // 로그인 버튼 클릭, 화면 전환
    // 자동 로그인 버튼
    @IBAction func autoLoginAction(_ sender: UIButton) {
        if autoLogin == false{
            autoLogin = true
            loginCheckImg.isHidden = false
        }else{
            autoLogin = false
            loginCheckImg.isHidden = true
        }
    }
    
    
    @IBAction func btnAct(_ sender: UIButton) {
        if (idTf.text == "") || (pwTf.text == ""){
            let dialog = UIAlertController(title: "로그인 실패", message: "이메일과 비밀번호를 입력해주세요", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
            dialog.addAction(action)
            self.present(dialog, animated: true, completion: nil)
        }else{
            logInit()
        }
    }
    
    func logInit(){
        /*
         //자동 로그인. 데이터가 있으면 불러온다
         if let userId = self.userdefault.string(forKey: "email"){
         self.uid = userId
         self.password = self.userdefault.string(forKey: "pwd")!
         }*/
        
        LoginService.logInit(email: idTf.text!,  password: pwTf.text!) {  (message)  in
            if message == "login success"{
                
                /*
                 // 성공이니까 데이터 저장하기
                 self.userdefault.set(self.gsno(self.idTf.text), forKey: "email")
                 self.userdefault.set(self.gsno(self.pwTf.text), forKey: "pwd")
                 
                 */
                
                //
                let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "MyTabViewController") as! MyTabViewController
                self.present(vc, animated: false, completion: nil)
                
            }else if message == "wrong password"{
                // alert
                let dialog = UIAlertController(title: "로그인 실패", message: "비밀번호를 다시 확인해주세요", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
                dialog.addAction(action)
                self.present(dialog, animated: true, completion: nil)
                
            }else if message == "wrong email"{
                //
                let dialog = UIAlertController(title: "로그인 실패", message: "이메일을 다시 확인해주세요", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
                dialog.addAction(action)
                self.present(dialog, animated: true, completion: nil)
            }
        }
        
    }
    
    
}

