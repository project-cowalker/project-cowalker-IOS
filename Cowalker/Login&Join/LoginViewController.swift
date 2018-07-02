//
//  LoginViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var idTf: UITextField!
    @IBOutlet weak var pwTf: UITextField!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    var autoLogin = false
    @IBOutlet weak var loginCheckImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginCheckImg.isHidden = true
        autoLogin = false
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
    
    
}

