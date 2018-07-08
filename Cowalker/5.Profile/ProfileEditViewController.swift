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
    @IBOutlet weak var introductionTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    let rolePicker = UIPickerView()
    let regionPicker = UIPickerView()
    let partPicker = UIPickerView()
    let purposePicker = UIPickerView()
    
    let roleArray = ["PM","기획자","디자이너","개발자","기타"]
    let regionArray = ["서울","경기도","인천","강원도","충청도","전라도","경상도","제주도"]
    let partArray = ["블록체인","IOT","인공지능","디자인","콘텐츠","기타"]
    let purposeArray = ["창업","공모전 참여","스터디","사이드 프로젝트","창작","기타"]



    override func viewDidLoad() {
        super.viewDidLoad()
        funcForNavigationBar()
        initPicker(text: roleTextField, picker: rolePicker, array: roleArray)
        initPicker(text: purposeTextField, picker: purposePicker, array: purposeArray)
        initPicker(text: partTextField, picker: partPicker, array: partArray)
        initPicker(text: regionTextField, picker: regionPicker, array: regionArray)
        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    

    func funcForNavigationBar(){
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "프로필 수정"
        let leftButtonItem = UIBarButtonItem(image: UIImage(named: "iconCaretLeftDarkgray"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(ProfileEditViewController.popAction))
        let rightButtonItem = UIBarButtonItem(image: UIImage(named: "btnNavbarDone"), style:UIBarButtonItemStyle.plain, target: self, action: #selector(ProfileEditViewController.finishedEditing))
        leftButtonItem.tintColor = UIColor.black
        rightButtonItem.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = leftButtonItem
        self.navigationItem.rightBarButtonItem = rightButtonItem
        
    }
    @objc func popAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    var myPageEdit: [MyPageEdit] = [MyPageEdit]()
    @objc func finishedEditing(){
        if roleTextField.text == "선택"{
            roleTextField.text = positionLabel
        }else if introductionTextField.text == "" {
            introductionTextField.text = introduceLabel
        }else if emailTextField.text == "" {
            emailTextField.text = emailLabel
        }else if purposeTextField.text == "선택"{
            purposeTextField.text = aimLabel
        }else if partTextField.text == "선택" {
            partTextField.text = departmentLabel
        }else if regionTextField.text == "선택"{
            regionTextField.text = areaLabel
        }
        //  여기서 이제 서버로 넘기기
        MypageService.myPageEdit(profile_img: profileImage, background_img: backgroundImage, name: nameLabel, position: roleTextField.text!, introduce: introductionTextField.text!, portfolio_url: emailTextField.text!, aim: purposeTextField.text!, department: partTextField.text!, area: regionTextField.text!) { (message) in
            if message == "update success"{
                self.navigationController?.popViewController(animated: true)
            }
        }
    
//        MypageService.myPageEdit(profile_img: profileImage, background_img: backgroundImage, email: emailTextField.text!, name: nameLabel, point: <#T##Int#>, position: roleTextField.text!, introduce: introductionTextField.text!, portfolio_url: <#T##String#>, aim: purposeTextField.text!, department: partTextField.text!, area: regionTextField.text!) { (message) in
//            if message == "update success"{
//                self.navigationController?.popViewController(animated: true)
//            }
//        }
        
//        MypageService.myPageEdit { (myPageEdit) in
//            self.myPageEdit = myPageEdit
//        }
//        self.navigationController?.popViewController(animated: true)
    }
    var profileImage = UIImage()
    var backgroundImage = UIImage()
    var nameLabel = ""
    var positionLabel = ""
    var introduceLabel = ""
    var emailLabel = ""
    var aimLabel = ""
    var departmentLabel = ""
    var areaLabel = ""
    
    //        nameLabel.text = myPage[0].name!
    //        positionLabel.text = myPage[0].position!
    //        introduceLabel.text = myPage[0].introduce!
    //        emailLabel.text = myPage[0].email!
    //        aimLabel.text = myPage[0].aim!
    //        departmentLabel.text = myPage[0].department!
    //        areaLabel.text = myPage[0].area!
    
    
    
    
    
    
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
        case rolePicker:
            doneButton = UIBarButtonItem (title: "확인", style: .done, target: self,action: #selector(selectedRolePicker))
        case purposePicker:
            doneButton = UIBarButtonItem (title: "확인", style: .done, target: self,action: #selector(selectedPurposePicker))
        case partPicker:
            doneButton = UIBarButtonItem (title: "확인", style: .done, target: self,action: #selector(selectedPartPicker))
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
    
    
 
    
    
    
    
    
}
