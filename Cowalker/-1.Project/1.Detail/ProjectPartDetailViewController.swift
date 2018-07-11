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
        partDetailLoad()
        self.title = "모집 상세"
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
            }else if self.tempUser == "참여완료"{
                self.longBtn.image = #imageLiteral(resourceName: "btnJoinProjectDone")
                self.longBtn.tintColor = UIColor.lightGray
            }
        }
    }
    //
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
        cell.numberLabel.text = temp2//String(recruitDetails[indexPath.row].number)
        cell.todoLabel.text = temp3//recruitDetails[indexPath.row].position
        cell.dayLabel.text = temp4//recruitDetails[indexPath.row].position
        return cell
    }
    @IBAction func btnClicAct(_ sender: UIButton) {
        let secondVC = UIStoryboard(name: "Apply", bundle:nil ).instantiateViewController(withIdentifier: "ProjectJoinViewController") as! ProjectJoinViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @IBAction func applyBtnAct(_ sender: UIButton) {
        let secondVC = UIStoryboard(name: "Detail", bundle:nil ).instantiateViewController(withIdentifier: "ApplyMemberViewController") as! ApplyMemberViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    @IBAction func participateBtnAct(_ sender: UIButton) {
        let secondVC = UIStoryboard(name: "Detail", bundle:nil ).instantiateViewController(withIdentifier: "ProjectMemberViewController") as! ProjectMemberViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}














