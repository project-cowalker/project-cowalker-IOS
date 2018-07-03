//
//  ProfileEditViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class ProfileEditViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == rolePicker {
            return roleArray.count
        }else if pickerView == regionPicker {
            return regionArray.count
        }else if pickerView == partPicker {
            return partArray.count
        }else{
            return purposeArray.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == rolePicker {
            return roleArray[row]
        }else if pickerView == regionPicker {
            return regionArray[row]
        }else if pickerView == partPicker {
            return partArray[row]
        }else{
            return purposeArray[row]
        }
    }
    // 선택한 Array의 row값을 가져오기 위해서 초기값인 selectRow에 해당 row를 가져옴
    //나중에 데이터 뽑아낼때 쓰기
//    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        selectRow = row
//    }
    
   
    
    @IBOutlet weak var rolePicker: UIPickerView!
    
    @IBOutlet weak var regionPicker: UIPickerView!
    
    @IBOutlet weak var partPicker: UIPickerView!
    
    @IBOutlet weak var purposePicker: UIPickerView!
    
    let roleArray = ["PM","기획자","디자이너","개발자","기타"]
    let regionArray = ["서울","경기도","인천","강원도","충청도","전라도","경상도","제주도"]
    let partArray = ["블록체인","IOT","인공지능","디자인","콘텐츠","기타"]
    let purposeArray = ["창업","공모전 참여","스터디","사이드 프로젝트","창작","기타"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        rolePicker.dataSource = self; rolePicker.delegate = self
        regionPicker.dataSource = self; regionPicker.delegate = self
        partPicker.dataSource = self; partPicker.delegate = self
        purposePicker.dataSource = self; purposePicker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func goBackToMyPage(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    
}
