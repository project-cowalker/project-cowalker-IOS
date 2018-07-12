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
    }
    func applyInit(){
        ApplyService.applyMemInit(add: tempRecruitIdx) { (members) in
            self.applyMembers = members
            self.applyTableView.reloadData()
            self.tempApplyIdx = members[0].apply_idx
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applyMembers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"applyMemTableViewCell") as! applyMemTableViewCell
        
        cell.memImg?.kf.setImage(with: URL(string: gsno(applyMembers[indexPath.row].profile_urle)), placeholder: UIImage())
        cell.memName.text = applyMembers[indexPath.row].user_name
        cell.memPart.text = applyMembers[indexPath.row].position
        cell.resumeBtn.tag = Int(applyMembers[indexPath.row].applicant_idx)!
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
    // 프로젝트 수락, 거절 버튼 
    @IBAction func replyBtnAct(_ sender: UIButton) {
        if sender.tag == 0{
            // 거절 버튼
        }else{
            // 수락 버튼
        }
    }
}















