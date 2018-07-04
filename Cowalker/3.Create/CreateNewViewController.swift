//
//  CreateNewViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//
import UIKit

class CreateNewViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var summaryTextField: UITextField!
    
    
    @IBAction func closeFunction(_ sender: Any) {
        //        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    @IBOutlet weak var commentOfIntro: UITextField!
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = (textField.text?.characters.count)! + string.characters.count - range.length
        return !(newLength > 25)
    }
    
    
    @IBAction func objectFunction(_ sender: UIButton) {
        
        defineWhichButton(i: 0, button: sender)
    }
    

    
    
    @IBAction func partFunction(_ sender: UIButton) {
        defineWhichButton(i: 1, button: sender)
     
        
    }
    
    
    
 
    
    @IBAction func regionFunction(_ sender: UIButton) {
        defineWhichButton(i: 2, button: sender)
        
    }
    
    var countForButton = [0,0,0]
    var tempForButton: [UIButton]!
    let temp = UIButton()
    let temp1 = UIButton()
    let temp2 = UIButton()
    var resultForButton: [UIButton]!
    let temp3 = UIButton()
    let temp4 = UIButton()
    let temp5 = UIButton()
    func defineWhichButton(i : Int, button : UIButton){
        
        switch i {
        case 0:
            selectedButton(i: countForButton[i], button: button, row: 0)
        case 1:
            selectedButton(i: countForButton[i], button: button, row: 1)
        case 2:
            selectedButton(i: countForButton[i], button: button, row: 2)
        
        default:
            break
        }
        
    }
    
    func selectedButton(i : Int, button: UIButton, row: Int){
        if i == 0 {
            tempForButton[row] = button
            button.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
            countForButton[row] = 1
            resultForButton[row] = button
            //서버 연동시 해당 데이터 여기서 처리
            
        }else {
            tempForButton[row].setBackgroundImage(UIImage(named: "btnHalfGray"), for: UIControlState.normal)
            button.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
            tempForButton[row] = button
            resultForButton[row] = button
           
            // 서버 연동시 해당 데이터 여기서 처리
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.commentOfIntro.delegate = self
        tempForButton = [temp,temp1,temp2]
        resultForButton = [temp3,temp4,temp5]
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func nextButtonFunc(_ sender: UIButton) {
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "CreateLastViewController") as? CreateLastViewController{
            secondVC.title2 = titleTextField.text!
            secondVC.summary = summaryTextField.text!
            secondVC.aim = resultForButton[0].currentTitle!   //purpose
            secondVC.department = resultForButton[1].currentTitle!// part
            secondVC.area = resultForButton[2].currentTitle!   //region
//            print(titleTextField.text)
//            print(summaryTextField.text)
//            print(resultForButton[0].currentTitle)
//            print(resultForButton[1].currentTitle)
//            print(resultForButton[2].currentTitle)
            
            self.navigationController?.pushViewController(secondVC, animated: true)
            
            
        }
    }
    
    
    
}

