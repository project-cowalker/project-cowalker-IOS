//
//  RecruitTwoViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 13..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class RecruitTwoViewController: UIViewController, UITextFieldDelegate ,UITextViewDelegate {

    @IBOutlet weak var taskLabel: UITextField!
    @IBOutlet weak var activityLabel: UITextField!
    @IBOutlet weak var areaLabel: UITextField!
    @IBOutlet weak var rewardLabel: UITextField!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    var tempPI = ""
    var tempPosition = ""
    var tempStart = ""
    var tempEnd = ""
    var tempNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isEnabled = false
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func backBtnAct(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {//버튼 클릭 가능
        if (taskLabel.text != "") && (activityLabel.text != "") && (areaLabel.text != "") && (rewardLabel.text != ""){
            nextBtn.isEnabled = true
        }else{
            nextBtn.isEnabled = false
        }
    }
    @IBAction func nextBtnAct(_ sender: UIButton) {
        let secondVC = UIStoryboard(name: "Recruit", bundle:nil ).instantiateViewController(withIdentifier: "RecruitThreeViewController") as! RecruitThreeViewController
        secondVC.tempPI = self.tempPI
        secondVC.tempPosition = self.tempPosition
        secondVC.tempStart = self.tempStart
        secondVC.tempEnd = self.tempEnd
        secondVC.tempNum = self.tempNum
        secondVC.tempTask = taskLabel.text!
        secondVC.tempActivity = activityLabel.text!
        secondVC.tempArea = areaLabel.text!
        secondVC.tempReward = rewardLabel.text!
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

