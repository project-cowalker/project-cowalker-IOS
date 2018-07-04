//
//  FilterViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tempForButton = [temp , temp1, temp2, temp3]
        defaultForButton = [defaultPurpose, defaultField, defaultRole,defaultRegion]
    }
    
    @IBAction func btnClickAct(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func purposeFunc(_ sender: UIButton) {
        
        defineWhichButton(i: 0, button: sender)
    }
    
    @IBAction func fieldFunc(_ sender: UIButton) {
        defineWhichButton(i: 1, button: sender)
        
    }
    
    
    @IBAction func roleFunc(_ sender: UIButton) {
        defineWhichButton(i: 2, button: sender)
    }
    
    
    @IBAction func regionFunc(_ sender: UIButton) {
        defineWhichButton(i: 3, button: sender)
        
    }
    
    
    var countForButton = [0,0,0,0]
    var tempForButton: [UIButton]!
    var temp = UIButton()
    var temp1 = UIButton()
    var temp2 = UIButton()
    var temp3 = UIButton()
    var firstResponse = true
    var defaultForButton: [UIButton]!
    
    @IBOutlet weak var defaultPurpose: UIButton!
    @IBOutlet weak var defaultField: UIButton!
    @IBOutlet weak var defaultRole: UIButton!
    @IBOutlet weak var defaultRegion: UIButton!
    
    
    
    
    func defineWhichButton(i : Int, button : UIButton){
        
        switch i {
        case 0:
            selectedButton(i: countForButton[i], button: button, row: 0)
        case 1:
            selectedButton(i: countForButton[i], button: button, row: 1)
        case 2:
            selectedButton(i: countForButton[i], button: button, row: 2)
        case 3:
            selectedButton(i: countForButton[i], button: button, row: 3)
        default:
            break
        }
        
    }
    
    func selectedButton(i : Int, button: UIButton, row: Int){
        if button == defaultForButton[row] && firstResponse {
            tempForButton[row] = button
            tempForButton[row].setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
            countForButton[row] = 1
            
        }else if i == 0 {
            defaultForButton[row].setBackgroundImage(UIImage(named: "btnHalfGray"), for: UIControlState.normal)
            tempForButton[row] = button
            button.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
            countForButton[row] = 1
            
            firstResponse = false
            //서버 연동시 해당 데이터 여기서 처리
            
        }else {
            tempForButton[row].setBackgroundImage(UIImage(named: "btnHalfGray"), for: UIControlState.normal)
            button.setBackgroundImage(UIImage(named: "btnHalfBlue"), for: UIControlState.normal)
            tempForButton[row] = button
            firstResponse = false
            
            // 서버 연동시 해당 데이터 여기서 처리
        }
    }
    
    
    
  

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
