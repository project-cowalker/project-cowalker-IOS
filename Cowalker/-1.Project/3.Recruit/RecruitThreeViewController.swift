//
//  RecruitThreeViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 13..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class RecruitThreeViewController: UIViewController, UITextFieldDelegate ,UITextViewDelegate {
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var abilityLabel: UITextField!
    @IBOutlet weak var careerLabel: UITextField!
    @IBOutlet weak var preferenceLabel: UITextField!
    @IBOutlet weak var commentLabel: UITextField!
    
    var tempPI = ""
    var tempPosition = ""
    var tempStart = ""
    var tempEnd = ""
    var tempNum = 0
    var tempTask = ""
    var tempActivity = ""
    var tempReward = ""
    var tempArea = ""
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func backBtnAct(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isEnabled = false
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if (abilityLabel.text != "") && (careerLabel.text != ""){
            nextBtn.isEnabled = true
        }else{
            nextBtn.isEnabled = false
        }
    }
    @IBAction func nextBtnAct(_ sender: UIButton) {
            let secondVC = UIStoryboard(name: "Recruit", bundle:nil ).instantiateViewController(withIdentifier: "RecruitFourViewController") as! RecruitFourViewController
            secondVC.tempPI = self.tempPI
            secondVC.tempPosition = self.tempPosition
            secondVC.tempStart = self.tempStart
            secondVC.tempEnd = self.tempEnd
            secondVC.tempNum = self.tempNum
            secondVC.tempTask = self.tempTask
            secondVC.tempActivity = self.tempActivity
            secondVC.tempArea = self.tempArea
            secondVC.tempReward = self.tempReward
            secondVC.tempAbility = abilityLabel.text!
            secondVC.tempCareer = careerLabel.text!
            secondVC.tempPreference = preferenceLabel.text!
            secondVC.tempComment = commentLabel.text!
            self.navigationController?.pushViewController(secondVC, animated: true)
    }
}
