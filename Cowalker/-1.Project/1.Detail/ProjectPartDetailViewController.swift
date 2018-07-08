//
//  ProjectPartDetailViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class ProjectPartDetailViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var partDetailCollectionView: UICollectionView!
    
    @IBOutlet weak var longBtn: UIBarButtonItem!
    var user = "0"
    
    var partList = ["개발자"]//,"디자이너","기획자","디자이너"]//,"개발자", "디자이너"]
    var numList = ["1명", "2명", "3명", "4명", "5명", "6명"]
    var ddayList = ["D - 1", "D - 2", "D - 3", "D - 4", "D - 5", "D - 6"]
    var detailList = ["웹,앱 서비스 개발", "로고 및 앱 디자인", "웹,앱 서비스 개발", "웹,앱 서비스 개발", "웹,앱 서비스 개발"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        partDetailLoad()
        self.title = "모집 상세"
        }
    
    //
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
    
    func partDetailLoad(){
        // 통신해서 자료 뿌리기
        RecruitService.recruitDetail(a: "5b3dd2387172d402215033d2", b: "5b3ecc11ca5c3444e4f802f1"){ (recruitDetails, userData) in
            self.recruitDetails = recruitDetails
        
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
            
            self.user = "개발자"//= "참여완료"//userData // 디폴트값 = 참여하기
            
            if self.user == "개발자"{               // 개설자
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
                if self.user == "참여하기"{
                    self.longBtn.image = #imageLiteral(resourceName: "btnJoinProject.png")
                }else if self.user == "참여대기"{
                    self.longBtn.image = #imageLiteral(resourceName: "btnJoinProjectWaiting.png")
                    self.longBtn.tintColor = UIColor.lightGray
                }else if self.user == "참여완료"{
                    self.longBtn.image = #imageLiteral(resourceName: "btnJoinProjectDone")
                    self.longBtn.tintColor = UIColor.lightGray
                }
            
           
            }
        //
    }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onePartCollectionViewCell", for: indexPath) as! onePartCollectionViewCell
        
        
        cell.partLabel.text = partList[indexPath.row]
        
        cell.numberLabel.text = partList[indexPath.row]
        cell.todoLabel.text = partList[indexPath.row]
        
        cell.dayLabel.text = partList[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:336*self.view.frame.width   , height: 90*self.view.frame.height/677)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
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














