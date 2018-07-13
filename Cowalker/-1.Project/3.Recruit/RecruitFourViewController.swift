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
    var tempQuestion = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextBtnAct(_ sender: UIButton) {
        
        if (questionLabel1.text != "") && (questionLabel2.text != ""){
     
            self.dismiss(animated: true, completion: nil)
        }
    }
}



