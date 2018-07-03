//
//  ProfileEditViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit


class ProfileEditViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
    @IBOutlet weak var roleTextField: UITextField!
    
    @IBOutlet weak var purposeTextField: UITextField!
    
    @IBOutlet weak var partTextField: UITextField!
    
    
    @IBOutlet weak var regionTextField: UITextField!
    
    
    
    let rolePicker = UIPickerView()
    let regionPicker = UIPickerView()
    let partPicker = UIPickerView()
    let purposePicker = UIPickerView()
    
    let roleArray = ["PM","기획자","디자이너","개발자","기타"]
    let regionArray = ["서울","경기도","인천","강원도","충청도","전라도","경상도","제주도"]
    let partArray = ["블록체인","IOT","인공지능","디자인","콘텐츠","기타"]
    let purposeArray = ["창업","공모전 참여","스터디","사이드 프로젝트","창작","기타"]
    
//    func addCancelDoneButton()  {
//        let keyboardToolbar = UIToolbar()
//        keyboardToolbar.sizeToFit()
//
//        let cancelBarButton = UIBarButtonItem(barButtonSystemItem: .cancel,
//                                              target: view, action: Selector(("cancelEditing:")))
//        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
//                                            target: nil, action: nil)
//        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done,
//                                            target: view, action: Selector(("doneEditing:")))
//        keyboardToolbar.items = [cancelBarButton, flexBarButton, doneBarButton]
////        self.inputAccessoryView = keyboardToolbar
//
//    }
    





    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func goBackToMyPage(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
//    func initPicker(){
//
//        let bar = UIToolbar()
//        bar.sizeToFit()
//
//        roleTextField.inputAccessoryView = bar
//        let doneButton = UIBarButtonItem (title: "확인", style: .done, target: self, action: #selector(selectedPicker))
//        bar.setItems([doneButton], animated: true)
//
//    }
    @objc func selectedRolePicker(){
        let row = rolePicker.selectedRow(inComponent: 0)
        roleTextField.text = roleArray[row]
        
        view.endEditing(true)
    }
    @objc func selectedRegionPicker(){
        let row = regionPicker.selectedRow(inComponent: 0)
        regionTextField.text = regionArray[row]
        
        view.endEditing(true)
    }
    @objc func selectedPurposePicker(){
        let row = purposePicker.selectedRow(inComponent: 0)
        purposeTextField.text = purposeArray[row]
        
        view.endEditing(true)
    }
    @objc func selectedPartPicker(){
        let row = partPicker.selectedRow(inComponent: 0)
        partTextField.text = partArray[row]
        
        view.endEditing(true)
    }
    @objc func canceledRolePicker(){
        view.endEditing(true)
    }
    func initialization(){
        roleTextField.inputView = rolePicker
        regionTextField.inputView = regionPicker
        purposeTextField.inputView = purposePicker
        partTextField.inputView = partPicker
        
        let bar = UIToolbar()
        bar.sizeToFit()
        roleTextField.inputAccessoryView = bar
        let doneButton = UIBarButtonItem (title: "확인", style: .done, target: self, action: #selector(selectedRolePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(canceledRolePicker))
        bar.setItems([cancelButton,spaceButton,doneButton], animated: true)
        
        let bar2 = UIToolbar()
        bar2.sizeToFit()
        regionTextField.inputAccessoryView = bar2
        let doneButton2 = UIBarButtonItem (title: "확인", style: .done, target: self, action: #selector(selectedRegionPicker))
        let spaceButton2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton2 = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(canceledRolePicker))
        bar2.setItems([cancelButton2,spaceButton2,doneButton2], animated: true)
        
        let bar3 = UIToolbar()
        bar3.sizeToFit()
        purposeTextField.inputAccessoryView = bar3
        let doneButton3 = UIBarButtonItem (title: "확인", style: .done, target: self, action: #selector(selectedPurposePicker))
        let spaceButton3 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton3 = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(canceledRolePicker))
        bar3.setItems([cancelButton3,spaceButton3,doneButton3], animated: true)
        
        let bar4 = UIToolbar()
        bar4.sizeToFit()
        partTextField.inputAccessoryView = bar4
        let doneButton4 = UIBarButtonItem (title: "확인", style: .done, target: self, action: #selector(selectedPartPicker))
        let spaceButton4 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton4 = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(canceledRolePicker))
        bar4.setItems([cancelButton4,spaceButton4,doneButton4], animated: true)

        
        rolePicker.dataSource = self; rolePicker.delegate = self
        regionPicker.dataSource = self; regionPicker.delegate = self
        partPicker.dataSource = self; partPicker.delegate = self
        purposePicker.dataSource = self; purposePicker.delegate = self
    }
    
    
    
    
    
}
