//
//  RecruitFourViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 13..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class RecruitFourViewController: UIViewController {

    @IBOutlet weak var questionLabel1: UITextField!
    @IBOutlet weak var questionLabel2: UITextField!
    
    var tempPI = ""
    var tempPosition = ""
    var tempStart = "2018-07-03"
    var tempEnd = "2018-07-03"
    var tempNum = 0
    var tempTask = ""
    var tempActivity = ""
    var tempReward = ""
    var tempArea = ""
    var tempAbility = ""
    var tempCareer = ""
    var tempPreference = ""
    var tempComment = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextBtnAct(_ sender: UIButton) {
        
        if (questionLabel1.text != "") && (questionLabel2.text != ""){
    
            
            RecruitService.recruitInit(project_idx:tempPI, position: self.tempPosition, start_date: "2018-07-03", end_date: "2018-07-03", number: self.tempNum, task: self.tempTask, activity: self.tempActivity, reward: self.tempReward, area: self.tempArea, ability: self.tempAbility, career: self.tempCareer, preference: self.tempPreference, comment: self.tempComment, question: [self.questionLabel1.text!, self.questionLabel2.text!]) { (message) in
                
                if message == "success"{
                    print("모집성공예예")
                    print()
                }else{
                     print("모집실패흑흑")
                }
                
                self.dismiss(animated: true, completion: nil)
                
                
            }
        }
    }
}
