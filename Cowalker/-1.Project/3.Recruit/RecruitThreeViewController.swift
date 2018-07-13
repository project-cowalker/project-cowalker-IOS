//
//  RecruitThreeViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 13..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class RecruitThreeViewController: UIViewController {

    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextBtnAct(_ sender: UIButton) {
    
        if (abilityLabel.text != "") && (careerLabel.text != "") && (preferenceLabel.text != "") && (commentLabel.text != ""){
            
            let secondVC = UIStoryboard(name: "Recruit", bundle:nil ).instantiateViewController(withIdentifier: "RecruitFourViewController") as! RecruitFourViewController
            self.navigationController?.pushViewController(secondVC, animated: true)
            
            
        }
        
    }
    

}
