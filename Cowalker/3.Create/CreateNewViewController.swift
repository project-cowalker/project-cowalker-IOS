//
//  CreateNewViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//
import UIKit

class CreateNewViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == purposePicker{
            return purposeArray.count
        }else if pickerView == departmentPicker {
            return departmentArray.count
        }else {
            return regionArray.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == purposePicker {
            return purposeArray[row]
        }else if pickerView == departmentPicker {
            return departmentArray[row]
        }else {
            return regionArray[row]
        }
    }
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var commentOfIntro: UITextField!
    
    @objc func selectedPurposePicker(){
        let row = purposePicker.selectedRow(inComponent: 0)
        purposeTextField.text = purposeArray[row]
        view.endEditing(true)
    }
    @objc func selectedDepartmentPicker(){
        let row = departmentPicker.selectedRow(inComponent: 0)
        departmentTextField.text = departmentArray[row]
        view.endEditing(true)
    }
    
    @objc func selectedRegionPicker(){
        let row = regionPicker.selectedRow(inComponent: 0)
        regionTextField.text = regionArray[row]
        view.endEditing(true)
    }
    @objc func canceledPicker() {
        view.endEditing(true)
    }
    func initPicker(text: UITextField, picker: UIPickerView,array: [String]){
        text.inputView = picker
        let bar = UIToolbar()
        bar.sizeToFit()
        text.inputAccessoryView = bar
        
        var doneButton = UIBarButtonItem (title: "확인", style: .done, target: self,action: #selector(selectedPurposePicker))
        switch picker {
        case purposePicker:
            doneButton = UIBarButtonItem (title: "확인", style: .done, target: self,action: #selector(selectedPurposePicker))
        case departmentPicker:
            doneButton = UIBarButtonItem (title: "확인", style: .done, target: self,action: #selector(selectedDepartmentPicker))
        case regionPicker:
            doneButton = UIBarButtonItem (title: "확인", style: .done, target: self,action: #selector(selectedRegionPicker))
        default :
            break
        }
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(canceledPicker))
        bar.setItems([cancelButton,spaceButton,doneButton], animated: true)
        picker.dataSource = self; picker.delegate = self
        
    }
    
    @IBAction func closeFunction(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MyTabViewController") as! MyTabViewController
        self.present(vc, animated: false, completion: nil)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
            if titleTextField.text != "" && commentOfIntro.text != "" && purposeTextField.text != "선택" && departmentTextField.text != "선택" && regionTextField.text != "선택" {
        
                buttonForNext.setBackgroundImage(UIImage(named: "btnFloatNormal"), for: UIControlState.normal)
                buttonForNext.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControlState.normal)
        
            }else {
                buttonForNext.setBackgroundImage(UIImage(named: "btnHalfGray"), for: UIControlState.normal)
                buttonForNext.setTitleColor(#colorLiteral(red: 0.8143514395, green: 0.8143706918, blue: 0.8143603206, alpha: 1), for: UIControlState.normal)
                
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = (textField.text?.characters.count)! + string.characters.count - range.length
        return !(newLength > 25)
    }
    

    @IBOutlet weak var purposeTextField: UITextField!
    @IBOutlet weak var departmentTextField: UITextField!
    @IBOutlet weak var regionTextField: UITextField!
    let purposePicker = UIPickerView()
    let departmentPicker = UIPickerView()
    let regionPicker = UIPickerView()
    let purposeArray = ["창업","공모전 참여", "스터디", "사이드 프로젝트", "창작", "기타"]
    let departmentArray = ["블록체인","IOT","인공지능","디자인","콘텐츠","기타"]
    let regionArray = ["서울","경기도","인천","강원도","충청도","전라도","경상도","제주도"]
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.commentOfIntro.delegate = self
        initPicker(text: purposeTextField, picker: purposePicker,array: purposeArray)
        initPicker(text: departmentTextField, picker: departmentPicker,array: departmentArray)
        initPicker(text: regionTextField, picker: regionPicker,array: regionArray)
       
        
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    @IBOutlet weak var buttonForNext: UIButton!
    
    @IBAction func nextButtonFunc(_ sender: UIButton) {
        
        if titleTextField.text != "" && commentOfIntro.text != "" && purposeTextField.text != "선택" && departmentTextField.text != "선택" && regionTextField.text != "선택" {
            if let secondVC = storyboard?.instantiateViewController(withIdentifier: "CreateLastViewController") as? CreateLastViewController{
                
                secondVC.title2 = titleTextField.text!
                secondVC.summary = commentOfIntro.text!
                secondVC.aim = purposeTextField.text!   //purpose
                secondVC.department = departmentTextField.text!// part
                secondVC.area = regionTextField.text!   //region
                
                
                self.navigationController?.pushViewController(secondVC, animated: true)
                
                
            }
            
        }
        
      
    }
    
    
    
}

