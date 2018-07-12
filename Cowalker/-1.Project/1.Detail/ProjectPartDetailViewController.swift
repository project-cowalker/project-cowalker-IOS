//
//  ProjectPartDetailViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class ProjectPartDetailViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    var tempProjectId = ""
    var tempRecruitId = ""
    var tempUser = ""
    
    @IBOutlet weak var detailPartCollectionView: UICollectionView!
    @IBOutlet weak var longBtn: UIBarButtonItem!
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var rewardLabel: UILabel!
    @IBOutlet weak var abilityLabel: UILabel!
    @IBOutlet weak var careerLabel: UILabel!
    @IBOutlet weak var preferenceLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    var recruitDetails: [RecruitDetail] = [RecruitDetail]()
    
    @IBOutlet weak var applyBtn: UIButton!
    @IBOutlet weak var btnConst: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "모집 상세"
        partDetailLoad()
    }
    func partDetailLoad(){
        // 통신해서 자료 뿌리기
        RecruitService.recruitDetail(a: self.tempProjectId, b: self.tempRecruitId){ (recruitDetails, userData) in
            self.recruitDetails = recruitDetails
            self.dataInit()
            self.btnInit()
            self.detailPartCollectionView.reloadData()
        }
    }
    func dataInit(){ // 데이터 입력
        print(recruitDetails[0])
        self.positionLabel.text = self.recruitDetails[0].position
        self.startLabel.text = self.recruitDetails[0].start_date
        self.numberLabel.text = String(self.recruitDetails[0].number)
        self.taskLabel.text = self.recruitDetails[0].task
        self.activityLabel.text = self.recruitDetails[0].activity
        self.areaLabel.text = self.recruitDetails[0].area
        self.rewardLabel.text = self.recruitDetails[0].reward
        self.abilityLabel.text = self.recruitDetails[0].ability
        self.careerLabel.text = self.recruitDetails[0].career
        self.preferenceLabel.text = self.recruitDetails[0].preference
        self.commentLabel.text = self.recruitDetails[0].comment
    }
    func btnInit(){
        if self.tempUser == "개발자"{               // 개설자
            // 롱버튼 바꾸기
            self.longBtn.image = #imageLiteral(resourceName: "btnProjectManage.png") // 프로젝트 관리
            // 지원멤버 보이기
            self.applyBtn.isHidden = false
            self.btnConst.constant = 60
        }else {                                // 손님
            // 지원멤버 지우기
            self.applyBtn.isHidden = true
            self.btnConst.constant = 0
            //롱버튼 바꾸기
            if self.tempUser == "참여하기"{
                self.longBtn.image = #imageLiteral(resourceName: "btnJoinProject.png")
            }else if self.tempUser == "참여대기"{
                self.longBtn.image = #imageLiteral(resourceName: "btnJoinProjectWaiting.png")
                self.longBtn.tintColor = UIColor.lightGray
                self.longBtn.isEnabled = false
            }else if self.tempUser == "참여완료"{
                self.longBtn.image = #imageLiteral(resourceName: "btnJoinProjectDone")
                self.longBtn.tintColor = UIColor.lightGray
                self.longBtn.isEnabled = false
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    var temp1 = ""
    var temp2 = ""
    var temp3 = ""
    var temp4 = ""
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailPartCollectionViewCell", for: indexPath) as! detailPartCollectionViewCell
        cell.partLabel.text = temp1 //recruitDetails[indexPath.row].position
        cell.numberLabel.text = temp2 + "명"//String(recruitDetails[indexPath.row].number)
        cell.todoLabel.text =  "D - " + temp4//recruitDetails[indexPath.row].position
        cell.dayLabel.text = temp3//recruitDetails[indexPath.row].position
        return cell
    }
    @IBAction func btnClicAct(_ sender: UIButton) {
        if self.tempUser == "개발자"{
            // 프로젝트 관리 코드
            // 알림 창 띄우기
            let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let firstAction: UIAlertAction = UIAlertAction(title: "프로젝트 수정", style: .default) { action -> Void in
                editAct()}
            let secondAction: UIAlertAction = UIAlertAction(title: "프로젝트 삭제", style: UIAlertActionStyle.destructive) { action -> Void in
                deleteAct()}
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }
            actionSheetController.addAction(firstAction)
            actionSheetController.addAction(secondAction)
            actionSheetController.addAction(cancelAction)
            present(actionSheetController, animated: true, completion: nil)
            func editAct(){// 수정
            }
            func deleteAct(){// 삭제
                let dialog = UIAlertController(title: "프로젝트 삭제", message: "삭제하겠습니다.", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
                dialog.addAction(action)
                self.present(dialog, animated: true, completion: nil)
        }
        }
        else{ // 참여하기인경우
            let secondVC = UIStoryboard(name: "Apply", bundle:nil ).instantiateViewController(withIdentifier: "ProjectJoinViewController") as! ProjectJoinViewController
            
            secondVC.tempProjectId = self.tempProjectId
            secondVC.tempRecruitId = self.tempRecruitId
            
            
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
    
    @IBAction func applyBtnAct(_ sender: UIButton) { // 지원멤버 이동
        let secondVC = UIStoryboard(name: "Detail", bundle:nil ).instantiateViewController(withIdentifier: "ApplyMemberViewController") as! ApplyMemberViewController
        secondVC.tempRecruitIdx = tempRecruitId
        secondVC.temp1 = self.temp1
        secondVC.temp2 = self.temp2
        secondVC.temp3 = self.temp3
        secondVC.temp4 = self.temp4
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    @IBAction func participateBtnAct(_ sender: UIButton) { // 참여멤버 // 항상 보이기
        let secondVC = UIStoryboard(name: "Detail", bundle:nil ).instantiateViewController(withIdentifier: "ProjectMemberViewController") as! ProjectMemberViewController
        secondVC.add = tempProjectId
        self.navigationController?.pushViewController(secondVC, animated: true)
        
        // 프로젝트 id 넘겨줘야 한다.
    }
}














