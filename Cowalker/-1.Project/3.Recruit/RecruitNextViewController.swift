//
//  RecruitNextViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 4..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class RecruitNextViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var ability: UITextView!
    @IBOutlet weak var career: UITextView!
    @IBOutlet weak var preference: UITextView!
    @IBOutlet weak var comment: UITextView!
    @IBOutlet weak var question: UITextView!
    
    var position: String = ""
    var start_date: String  = "2018-05-09"
    var end_date: String = ""
    var number: Int = 0
    var task: String = ""
    var activity: String = ""
    var rewartd: String = ""
    var area:String = ""
    
    var QuestionArray = [""]
   //var a = "2018-05-09"
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //func textViewshouldretr
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionArray.append(question.text)
        
        
    }

    @IBAction func BtnClickAct(_ sender: UIButton) {
        
        RecruitService.recruitInit(position: position, start_date: start_date, end_date: start_date, number: number, task: task, activity: activity, reward: rewartd, area: area, ability: ability.text, career: career.text, preference: preference.text, comment: comment.text, question: QuestionArray) { (message) in
            
            if message == "access denied"{
                let dialog = UIAlertController(title: "접근 실패", message: "로그인을 다사해주세요", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
                dialog.addAction(action)
                self.present(dialog, animated: true, completion: nil)
            }else if message == "fail"{
                
                let dialog = UIAlertController(title: "값 전달 실패", message: "전달값을 다시 입력해주세요", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
                dialog.addAction(action)
                self.present(dialog, animated: true, completion: nil)
            }else if message == "success"{
                // 성공시에 화면 이동 표현하기
        }
        }
        
        // 화면전환 /////두번 이동으로 수정하기-------------------------------
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
}
