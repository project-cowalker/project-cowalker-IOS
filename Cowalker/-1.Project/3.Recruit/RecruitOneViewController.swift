//
//  RecruitOneViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 13..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class RecruitOneViewController: UIViewController, UITextFieldDelegate ,UITextViewDelegate {

    var tempRole = "PM"
    var tempDay = ""
    
    var num1 = 0
    var num2 = 0
    var num3 = 0
    
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 다음버튼 비활성화
       // nextBtn.isEnabled = false
        //nextBtn.backgroundColor = UIColor.lightGray
        self.navigationController?.isNavigationBarHidden = true // 상단 없애기
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func positionBtnAct(_ sender: UIButton) {
        tempRole = (sender.titleLabel?.text)!
    }
    
    @IBOutlet weak var numberTf: UITextField!
    
    
    //역할, 기간, 인원 모두 채워지면 다음 뷰로 이동, 값 전달해야
    @IBAction func nextBtnAct(_ sender: UIButton) {
        if (numberTf.text != "") {
            
              let secondVC = UIStoryboard(name: "Recruit", bundle:nil ).instantiateViewController(withIdentifier: "RecruitTwoViewController") as! RecruitTwoViewController
        
            self.navigationController?.pushViewController(secondVC, animated: true)
            // 값 전달
            secondVC.tempPosition = tempRole
            secondVC.tempStart = ""
            secondVC.tempEnd = ""
            secondVC.tempNum = Int(numberTf.text!)!
        }
    }
    
}















