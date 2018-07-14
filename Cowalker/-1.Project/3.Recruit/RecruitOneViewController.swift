//
//  RecruitOneViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 13..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class RecruitOneViewController: UIViewController, UITextFieldDelegate ,UITextViewDelegate {
  
    
    var tempPI = ""
    var tempRole = "PM"
    var tempDay = ""
    @IBOutlet weak var numberTf: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        nextBtn.isEnabled = false
        tempPI = ProjectIntroViewController.plusTempPi
        
    }
     func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {//버튼 클릭 가능
        if numberTf.text != ""{
            nextBtn.isEnabled = true
        }else{
            nextBtn.isEnabled = false
        }
    }
    @IBAction func backBtnAct(_ sender: UIButton) { // 뒤로가기 버튼
        self.dismiss(animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    var num1 = 1
    var num2 = 0
    var num3 = 0
    var num4 = 0
    var num5 = 0
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    @IBAction func positionBtnAct(_ sender: UIButton) {
        btn1.setImage(#imageLiteral(resourceName: "btnPmGray"), for: .normal)
        btn2.setImage(#imageLiteral(resourceName: "btnPlanGray"), for: .normal)
        btn3.setImage(#imageLiteral(resourceName: "btnDesignerGray"), for: .normal)
        btn4.setImage(#imageLiteral(resourceName: "btnDeveloperGray"), for: .normal)
        btn5.setImage(#imageLiteral(resourceName: "btnEtcGray"), for: .normal)
        
        if sender.tag == 0{
            tempRole = "PM"
            sender.setImage(#imageLiteral(resourceName: "btnPmBlue"), for: .normal)
        }else if sender.tag == 1{
            tempRole = "기획자"
            sender.setImage(#imageLiteral(resourceName: "btnPlanBlue"), for: .normal)
        }else if sender.tag == 2{
            tempRole = "디자이너"
            sender.setImage(#imageLiteral(resourceName: "btnDesignerBlue"), for: .normal)
        }else if sender.tag == 3{
            tempRole = "개발자"
            sender.setImage(#imageLiteral(resourceName: "btnDeveloperBlue"), for: .normal)
        }else if sender.tag == 4{
            tempRole = "기타"
            sender.setImage(#imageLiteral(resourceName: "btnEtcBlue"), for: .normal)
        }
    }
    //역할, 기간, 인원 모두 채워지면 다음 뷰로 이동, 값 전달해야
    @IBAction func nextBtnAct(_ sender: UIButton) {
        if (numberTf.text != "") {
            let secondVC = UIStoryboard(name: "Recruit", bundle:nil ).instantiateViewController(withIdentifier: "RecruitTwoViewController") as! RecruitTwoViewController
            self.navigationController?.pushViewController(secondVC, animated: true)
            
            secondVC.tempPI = self.tempPI
            print(self.tempPI)
            secondVC.tempPosition = tempRole
            secondVC.tempStart = "2018-03-08"
            secondVC.tempEnd = "2018-05-07"
            secondVC.tempNum = Int(numberTf.text!)!
        }
    }
    
    @IBOutlet weak var startDateText: UITextField!
    
    @IBOutlet weak var lastDateText: UITextField!
    let startPicker = UIDatePicker()
    let endPicker = UIDatePicker()
    

    
    
    
    
    
    
    
    
    
    
    
    
    
}















