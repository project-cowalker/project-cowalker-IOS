//
//  RecruitFourViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 13..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class RecruitFourViewController: UIViewController, UITextFieldDelegate ,UITextViewDelegate {

    @IBOutlet weak var questionLabel1: UITextField!
    @IBOutlet weak var questionLabel2: UITextField!
    
    var tempPI = ""
    var tempPosition = ""
    var tempStart = ""
    var tempEnd = ""
    var tempNum = 0
    var tempTask = ""
    var tempActivity = ""
    var tempReward = ""
    var tempArea = ""
    var tempAbility = ""
    var tempCareer = ""
    var tempPreference = ""
    var tempComment = ""
    
    @IBAction func backBtnAct(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func nextBtnAct(_ sender: UIButton) {
            RecruitService.recruitInit(project_idx:tempPI, position: self.tempPosition, start_date: self.tempStart, end_date: self.tempEnd, number: self.tempNum, task: self.tempTask, activity: self.tempActivity, reward: self.tempReward, area: self.tempArea, ability: self.tempAbility, career: self.tempCareer, preference: self.tempPreference, comment: self.tempComment, question: [self.questionLabel1.text!, self.questionLabel2.text!]) { (message) in
                if message == "success"{
                }else{
                }
                self.dismiss(animated: true, completion: nil)
                // 하단 업데이트 하기
                
        }
    }
}
