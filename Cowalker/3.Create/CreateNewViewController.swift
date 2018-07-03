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
    
    @IBAction func closeFunction(_ sender: Any) {
        //        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //titleTextField 받아오기
    }
    
    
    
    @IBOutlet weak var commentOfIntro: UITextField!
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = (textField.text?.characters.count)! + string.characters.count - range.length
        return !(newLength > 25)
    }
    
    
    var countForObjectFunc = 0
    var temp = UIButton()
    @IBAction func objectFunction(_ sender: UIButton) {
        if countForObjectFunc == 0 {
            temp = sender
            sender.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
            countForObjectFunc = 1
            // 해당 text 서버 연동시 여기닥 가져오기
            
        }else
        {
            
            temp.setBackgroundImage(UIImage(named: "btnHalfGray"), for: UIControlState.normal)
            
            sender.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
            temp = sender
            // 해당 text 서버 연동시 여기닥 가져오기
            
            
            
        }
        
    }
    
    var countForPartFunc = 0
    var temp2 = UIButton()
    
    
    @IBAction func partFunction(_ sender: UIButton) {
        if countForPartFunc == 0 {
            temp2 = sender
            sender.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
            countForPartFunc = 1
            // 해당 text 서버 연동시 여기닥 가져오기
            
        }else
        {
            
            temp2.setBackgroundImage(UIImage(named: "btnHalfGray"), for: UIControlState.normal)
            
            sender.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
            temp2 = sender
            // 해당 text 서버 연동시 여기닥 가져오기
            
            
            
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
        self.commentOfIntro.delegate = self
        
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

