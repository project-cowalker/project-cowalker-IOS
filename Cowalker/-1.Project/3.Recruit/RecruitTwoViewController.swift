//
//  RecruitTwoViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 13..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class RecruitTwoViewController: UIViewController {

    @IBOutlet weak var taskLabel: UITextField!
    
    @IBOutlet weak var activityLabel: UITextField!
    
    @IBOutlet weak var areaLabel: UITextField!
    
    @IBOutlet weak var rewardLabel: UITextField!
    
    var tempPosition = ""
    var tempStart = ""
    var tempEnd = ""
    var tempNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func nextBtnAct(_ sender: UIButton) {
        
        if (taskLabel.text != "") && (activityLabel.text != "") && (areaLabel.text != "") && (rewardLabel.text != ""){
            
            let secondVC = UIStoryboard(name: "Recruit", bundle:nil ).instantiateViewController(withIdentifier: "RecruitThreeViewController") as! RecruitThreeViewController
            
            
            self.navigationController?.pushViewController(secondVC, animated: true)
            
            secondVC.tempPosition = self.tempPosition
            secondVC.tempStart = ""
            secondVC.tempEnd = ""
            secondVC.tempNum = self.tempNum
            
            secondVC.tempTask = taskLabel.text!
            secondVC.tempActivity = activityLabel.text!
        }
        
        
    }
    
    }
