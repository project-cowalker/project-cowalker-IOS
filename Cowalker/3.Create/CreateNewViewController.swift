//
//  CreateNewViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//
import UIKit

class CreateNewViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var commentTextView: UITextView!
    
    @IBAction func closeFunction(_ sender: Any) {
        //        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    var countForObjectFunc = 0
    var textForObjectFunc = 0
    var boolForText = false
    var boolForButton = false
    var temp = UIButton()
    var tempForText = UITextField()
    
    @IBOutlet weak var idTf: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        
        if textField == idTf {
            tempForText = textField
            if (boolForText && boolForButton == false) && textField.text != ""{
                if textForObjectFunc == 0 {
                    textField.background = UIImage(named: "btnHalfBlue")
                    textForObjectFunc = 1
                }
                
                boolForText = true
                
            }else {
                if textField.text != ""{
                    
                    
                    
                    if boolForButton {
                        temp.setBackgroundImage(UIImage(named: "btnHalfGray"), for: UIControlState.normal)
                        textField.background = UIImage(named: "btnHalfBlue")
                        boolForButton = false
                        boolForText = true
                        textForObjectFunc = 1
                    }else{
                        textField.background = UIImage(named: "btnHalfBlue")
                        boolForText = true
                        boolForButton = false
                        textForObjectFunc = 1
                    }
                }
            }
        }else {
            tempForText2 = textField
            if (boolForText2 && boolForButton2 == false) && textField.text != ""{
                if textForObjectFunc2 == 0 {
                    textField.background = UIImage(named: "btnHalfBlue")
                    textForObjectFunc2 = 1
                }
                
                boolForText2 = true
                
            }else {
                if textField.text != ""{
                    
                    
                    
                    if boolForButton2 {
                        temp2.setBackgroundImage(UIImage(named: "btnHalfGray"), for: UIControlState.normal)
                        textField.background = UIImage(named: "btnHalfBlue")
                        boolForButton2 = false
                        boolForText2 = true
                        textForObjectFunc2 = 1
                    }else{
                        textField.background = UIImage(named: "btnHalfBlue")
                        boolForText2 = true
                        boolForButton2 = false
                        textForObjectFunc2 = 1
                    }
                }
            }
        }
    }
    
    
    
    
    @IBAction func objectFunction(_ sender: UIButton) {
        if boolForButton || boolForText == false {
            if countForObjectFunc == 0 {
                temp = sender
                sender.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
                countForObjectFunc = 1
                // 해당 text 서버 연동시 여기닥 가져오기
                boolForButton = true
                boolForText = false
                
            }
            else
            {
                
                temp.setBackgroundImage(UIImage(named: "btnHalfGray"), for: UIControlState.normal)
                
                sender.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
                temp = sender
                boolForButton = true
                boolForText = false
                countForObjectFunc = 1
                // 해당 text 서버 연동시 여기닥 가져오기
                
                
                
            }
            
        }else{
            
            if boolForText {
                temp = sender
                tempForText.background = UIImage(named: "btnHalfGray")
                sender.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
                boolForText = false
                boolForButton = true
                
                
            }else {
                temp.setBackgroundImage(UIImage(named: "btnHalfGray"), for: UIControlState.normal)
                
                sender.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
                temp = sender
                boolForButton = true
                boolForText = false
                
                
            }
        }
        
    }
    
    @IBOutlet weak var partTf: UITextField!
    var temp2 = UIButton()
    var tempForText2 = UITextField()
    var countForObjectFunc2 = 0
    var textForObjectFunc2 = 0
    var boolForText2 = false
    var boolForButton2 = false
    
    @IBAction func partFunction(_ sender: UIButton) {
        
        if boolForButton2 || boolForText2 == false {
            if countForObjectFunc2 == 0 {
                temp2 = sender
                sender.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
                countForObjectFunc2 = 1
                // 해당 text 서버 연동시 여기닥 가져오기
                boolForButton2 = true
                boolForText2 = false
                
            }
            else
            {
                
                temp2.setBackgroundImage(UIImage(named: "btnHalfGray"), for: UIControlState.normal)
                
                sender.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
                temp2 = sender
                boolForButton2 = true
                boolForText2 = false
                countForObjectFunc2 = 1
                // 해당 text 서버 연동시 여기닥 가져오기
                
                
                
            }
            
        }else{
            
            if boolForText2 {
                temp2 = sender
                tempForText2.background = UIImage(named: "btnHalfGray")
                sender.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
                boolForText2 = false
                boolForButton2 = true
                
                
            }else {
                temp2.setBackgroundImage(UIImage(named: "btnHalfGray"), for: UIControlState.normal)
                
                sender.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
                temp2 = sender
                boolForButton2 = true
                boolForText2 = false
                
                
            }
        }
        
    }
    
    
    
    var countForRegionFunc = 0
    var temp3 = UIButton()
    
    @IBAction func regionFunction(_ sender: UIButton) {
        if countForRegionFunc == 0 {
            temp3 = sender
            sender.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
            countForRegionFunc = 1
            // 해당 text 서버 연동시 여기닥 가져오기
            
        }else
        {
            
            temp3.setBackgroundImage(UIImage(named: "btnHalfGray"), for: UIControlState.normal)
            
            sender.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
            temp3 = sender
            // 해당 text 서버 연동시 여기닥 가져오기
            
            
            
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func nextButtonFunc(_ sender: UIButton) {
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "CreateLastViewController") as? CreateLastViewController{
            
            
            self.navigationController?.pushViewController(secondVC, animated: true)
            
            
        }
    }
    
    
    
}

