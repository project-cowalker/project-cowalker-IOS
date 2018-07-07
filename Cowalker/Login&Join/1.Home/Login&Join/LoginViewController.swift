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
    @IBOutlet weak var loginCheckImg: UIImageView!
    var autoLogin = false
    
    let userdefault = UserDefaults.standard///
    var uid:String!
    var password:String!
   // var tok:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginCheckImg.isHidden = true
        autoLogin = false
        ///////////////////////////////// 이전에 저장된게 있다면, 자동 로그인 실행
         if let userId = userdefault.string(forKey: "email"){
         self.logInit()
         }
        
        idTf.text = ""
        pwTf.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // tf 라인 색 변화
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == idTf {
            view1.backgroundColor = UIColor(red: 100.0/255.0, green: 223.0/255.0, blue: 255.0/255.0, alpha: 1.0)}else{
            view2.backgroundColor = UIColor(red: 100.0/255.0, green: 223.0/255.0, blue: 255.0/255.0, alpha: 1.0)}}
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if textField == idTf {
            if idTf.text == ""{
                view1.backgroundColor = UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1.0)}}else{
            if pwTf.text == ""{
                view2.backgroundColor = UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1.0)}}}
    // 자동 로그인 버튼
    @IBAction func autoLoginAction(_ sender: UIButton) {
        if autoLogin == false{
            autoLogin = true
            loginCheckImg.isHidden = false
            sender.setTitleColor(.black, for: .normal)
            
        }else{
            autoLogin = false
            loginCheckImg.isHidden = true
        sender.setTitleColor(.lightGray, for: .normal)
        }
    }
                @IBAction func btnAct(_ sender: UIButton) { //로그인 버튼
        if (idTf.text == "") || (pwTf.text == ""){ // 비어있는 칸이 있을 때
            let dialog = UIAlertController(title: "로그인 실패", message: "이메일과 비밀번호를 입력해주세요", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
            dialog.addAction(action)
            self.present(dialog, animated: true, completion: nil)
        }else{
            logInit()}}
    
    func logInit(){
         //자동 로그인. 데이터가 있으면 불러와서 데이터에 넣는다.
        if let userId = self.userdefault.string(forKey: "email"){
            self.idTf.text = userId
            self.pwTf.text = self.userdefault.string(forKey: "pwd")!
            
         }
        // 통신
        LoginService.logInit(email: idTf.text!,  password: pwTf.text!) {  (arr)  in
            
            
            
            if arr[0] == "login success"{
                
                if self.autoLogin == true {
                 // 성공한 경우에 데이터 저장하기
                 self.userdefault.set(self.gsno(self.idTf.text), forKey: "email")
                 self.userdefault.set(self.gsno(self.pwTf.text), forKey: "pwd")
                    self.userdefault.set(self.gsno(arr[1]), forKey: "token")
                    
                    
               // self.userdefault.set(arr[1], forkey: "token")
                }
                let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "MyTabViewController") as! MyTabViewController
                self.present(vc, animated: false, completion: nil)
            }else if arr[0] == "wrong password"{
                // alert
                let dialog = UIAlertController(title: "로그인 실패", message: "비밀번호를 다시 확인해주세요", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
                dialog.addAction(action)
                self.present(dialog, animated: true, completion: nil)
            }else if arr[0] == "wrong email"{
                //
                let dialog = UIAlertController(title: "로그인 실패", message: "이메일을 다시 확인해주세요", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
                dialog.addAction(action)
                self.present(dialog, animated: true, completion: nil)
            }
            //(token) in
            //print(token)
        }
    }
}

