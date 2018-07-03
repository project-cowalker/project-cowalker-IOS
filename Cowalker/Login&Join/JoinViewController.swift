//
//  JoinViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var passwordTf2: UITextField!
    @IBOutlet weak var nameTf: UITextField!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var joinBt: UIButton!
    var checkArray = [0,0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        joinBt.isEnabled = false
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func checkEmailAction(_ sender: UIButton) {
        //emailTf.text 검사
    }
    
    // tf 건들면 작동, 파란색으로
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTf {
            view1.backgroundColor = UIColor(red: 100.0/255.0, green: 223.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            
        }else if textField == passwordTf {
            view2.backgroundColor = UIColor(red: 100.0/255.0, green: 223.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            label1.isHidden = true
        }else if textField == passwordTf2{
            view3.backgroundColor = UIColor(red: 100.0/255.0, green: 223.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            label2.isHidden = true
        }else{
            view4.backgroundColor = UIColor(red: 100.0/255.0, green: 223.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            label3.isHidden = true
        }
    }
    
    // tf 건든 후 검사
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
        if textField == emailTf {
            if emailTf.text == ""{ // 비어있거나 잘못 입력되면 빨간색
                
                view1.backgroundColor = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                checkArray[0] = 0}
            else {
                checkArray[0] = 1
                }
        }else if textField == passwordTf{
            if passwordTf.text == ""{
                label1.isHidden = false
                label1.textColor = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                view2.backgroundColor = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                checkArray[1] = 0}
            else{
                checkArray[1] = 1
            }
                
        }else if textField == passwordTf2{
            if passwordTf2.text == ""{
                label2.isHidden = false
                label2.textColor = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                view3.backgroundColor = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                checkArray[2] = 0
            }else{
                checkArray[2] = 1
            }
        }else if textField == nameTf{
            if nameTf.text == ""{
                label3.isHidden = false
                label3.textColor = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                view4.backgroundColor = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                checkArray[3] = 0
            }
            else{
                checkArray[3] = 1
                
            }
        }
        
        // 성공시
        if checkArray == [1,1,1,1] {
            joinBt.isEnabled = true
            joinBt.setBackgroundImage(#imageLiteral(resourceName: "btnNomal"), for: .normal)
            joinBt.setTitleColor(UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0), for: UIControlState.normal)
        }else{
            joinBt.isEnabled = false
            joinBt.setBackgroundImage(#imageLiteral(resourceName: "btnInactive"), for: .normal)
            joinBt.setTitleColor(UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1.0), for: UIControlState.normal)
            
        }
    }

    @IBAction func JoinButAct(_ sender: UIButton) {
        print(0)
        JoinService.joinInit(email: emailTf.text!, password: passwordTf.text!, name: nameTf.text!){ () in
            print(00)
            self.view1.isHidden = true
            //self.dismiss(animated: true, completion: nil)}
            //self.emailTf.text = ""
            
        }
    }
    
}
