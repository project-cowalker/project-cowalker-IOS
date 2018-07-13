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
    @IBAction func positionBtnAct(_ sender: UIButton) {
        if sender.tag == 0{
            tempRole = "PM"
        }else if sender.tag == 1 {
            tempRole = "기획자"
        }else if sender.tag == 2{
            tempRole = "디자이너"
        }else if sender.tag == 3{
            tempRole = "개발자"
        }else if sender.tag == 4{
            tempRole = "기타"}
    }
    //역할, 기간, 인원 모두 채워지면 다음 뷰로 이동, 값 전달해야
    @IBAction func nextBtnAct(_ sender: UIButton) {
        if (numberTf.text != "") {
            let secondVC = UIStoryboard(name: "Recruit", bundle:nil ).instantiateViewController(withIdentifier: "RecruitTwoViewController") as! RecruitTwoViewController
            self.navigationController?.pushViewController(secondVC, animated: true)
            
            secondVC.tempPI = self.tempPI
            print("제발되라시발")
            print(self.tempPI)
            secondVC.tempPosition = tempRole
            secondVC.tempStart = "2018-03-08"
            secondVC.tempEnd = "2018-05-07"
            secondVC.tempNum = Int(numberTf.text!)!
        }
    }
}















