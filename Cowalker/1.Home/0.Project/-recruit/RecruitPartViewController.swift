//
//  RecruitPartViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 4..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class RecruitPartViewController: UIViewController, UITextFieldDelegate ,UITextViewDelegate{
    
    @IBOutlet weak var positionBtn: UIButton!
    //
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var task: UITextView!
    @IBOutlet weak var activity: UITextView!
    @IBOutlet weak var reward: UITextView!
    @IBOutlet weak var area: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
}
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNextView" {
            let destVC = segue.destination as! RecruitNextViewController
            
            destVC.position = (positionBtn.titleLabel?.text)!
            destVC.start_date = "2018-05-07"
            destVC.end_date = "2018-05-08"
            destVC.number = 3
            destVC.task = task.text
            destVC.activity = activity.text
            destVC.rewartd = reward.text
            destVC.area = area.text
        }
    }
}



























