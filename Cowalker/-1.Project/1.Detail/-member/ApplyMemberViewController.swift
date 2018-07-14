//
//  ApplyMemberViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 7..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class ApplyMemberViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //
    var applyMembers: [ApplyMember] = [ApplyMember]()
    //
    var tempRecruitIdx = ""
    var tempApplyIdx = ""
    
//
    var temp1 = ""
    var temp2 = ""
    var temp3 = ""
    var temp4 = ""
    
    @IBOutlet weak var applyTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "지원 멤버"
        applyInit()
        funcForNavigationBar()
    }
    func applyInit(){
        ApplyService.applyMemInit(add: tempRecruitIdx) { (members) in
            self.applyMembers = members
            self.applyTableView.reloadData()
            self.tempApplyIdx = members[0].apply_idx
            print("성공")
            print(self.applyMembers[0].position)
        }
    }
    
    func funcForNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false // 상단 바 보이게
        self.tabBarController?.tabBar.isHidden = true // 하단 탭바 삭제
        let leftButtonItem = UIBarButtonItem(image: UIImage(named: "iconCaretLeftDarkgray"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(popAction))
        leftButtonItem.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = leftButtonItem}
    @objc func popAction(){ // 뒤로가기 버튼
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = false}
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applyMembers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"applyMemTableViewCell") as! applyMemTableViewCell
        
        cell.memImg?.kf.setImage(with: URL(string: gsno(applyMembers[indexPath.row].profile_url)), placeholder: UIImage())
        cell.memName.text = applyMembers[indexPath.row].user_name
        cell.memPart.text = applyMembers[indexPath.row].position
        cell.resumeBtn.tag = Int(applyMembers[indexPath.row].applicant_idx)!
        //
        
        
        
        //
        
        return cell
    }
    
    // 이력서 화면으로 이동, 해당되는 셀의 이력서 아이디 값들 전달해야한다.
    @IBAction func resumeBtnAct(_ sender: UIButton) {
        // 지원서 조회 화면으로 이동한다.
        let secondVC = UIStoryboard(name: "Detail", bundle:nil ).instantiateViewController(withIdentifier: "ResumeViewController") as! ResumeViewController
        // 다음화면으로 필요한 두개의 값전달하기
        secondVC.tempApplicantId = String(sender.tag)
        secondVC.tempApplyId = tempApplyIdx
        secondVC.temp1 = self.temp1
        secondVC.temp2 = self.temp2
        secondVC.temp3 = self.temp3
        secondVC.temp4 = self.temp4

        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    var num1 = 0
    var num2 = 0
    
    var te1 = ""
    var te2 = ""
    var te3 = 0
    
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    var cc = 0
    
    // 프로젝트 수락, 거절 버튼 
    @IBAction func replyBtnAct(_ sender: UIButton) {
        /*
        if sender == btn1 {
            cc = 2
        }else {
            cc = 1
        }
        
        //
        apply_idx : 지원 고유 idx
        applicant_idx : 지원자 idx
        join : 참여 여부 (수락 : 1, 거절 : 2 | default : 0)
        //
        
        
        ApplyService.applySelect(a: <#T##String#>, b: <#T##String#>, c: cc){ (message) in
            if message == "success"{
                
                }else{
                
            }
        }
        
        if sender.tag == 0{
            // 거절 버튼
            
        }else{
            // 수락 버튼
            
        }*/
    }
}















