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
    var tempUser = ""////
    
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
        listDetailLoad()
        funcForNavigationBar()
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
    
    
    
    var tempIndex = 0
    var tempRecruitLists : [RecruitList] = [RecruitList]()
    
    var te1 = ""
    var te2 = ""
    var te3 = ""
    var te4 = ""
    
    func listDetailLoad(){
        RecruitService.recruitList(add: tempProjectId){ (recruitLists) in
            self.tempRecruitLists = recruitLists
            print(self.tempRecruitLists[0])
            self.detailPartCollectionView.reloadData()
            self.te1 = self.tempRecruitLists[0].position
            self.te2 = String(self.tempRecruitLists[0].number)
            self.te3 = self.tempRecruitLists[0].task
            self.te4 = self.tempRecruitLists[0].dday
        }
    }
    
    func partDetailLoad(){
        RecruitService.recruitDetail(a: self.tempProjectId, b: self.tempRecruitId){ (recruitDetails, userData) in
            self.recruitDetails = recruitDetails
            self.tempUser = userData/////
            self.dataInit() //
            self.btnInit() //
            // 개발자 개설자 저장
            self.detailPartCollectionView.reloadData()
        }
    }
    func dataInit(){ // 데이터 입력
        self.positionLabel.text = self.recruitDetails[0].position
        self.startLabel.text = self.recruitDetails[0].start_date
        self.numberLabel.text = String(describing: self.recruitDetails[0].number!)/////////
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
        print(tempUser)
        if self.tempUser == "개설자"{
            self.longBtn.image = #imageLiteral(resourceName: "btnProjectManage.png") // 프로젝트 관리
            self.applyBtn.isHidden = false// 지원멤버 보이기
            self.btnConst.constant = 60
        }else {
            self.applyBtn.isHidden = true // 지원멤버 지우기
            self.btnConst.constant = 0
            if self.tempUser == "참여하기"{//롱버튼 바꾸기
                self.longBtn.image = #imageLiteral(resourceName: "btnJoinProject.png")
            }else if self.tempUser == "참여대기"{
                self.longBtn.image = #imageLiteral(resourceName: "btnJoinProjectWaiting.png")
                self.longBtn.tintColor = UIColor.lightGray
                self.longBtn.isEnabled = false
            }else if self.tempUser == "참여완료"{
                self.longBtn.image = #imageLiteral(resourceName: "btnJoinProjectDone")
                self.longBtn.tintColor = UIColor.lightGray
                self.longBtn.isEnabled = false
            }}}
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailPartCollectionViewCell", for: indexPath) as! detailPartCollectionViewCell
        
        
        cell.partLabel.text = te1 //tempRecruitLists[0].position
        cell.numberLabel.text = te2 //String(tempRecruitLists[0].number) + "명"
        cell.todoLabel.text =    te3 //tempRecruitLists[0].task
        cell.dayLabel.text = "D" + te4//tempRecruitLists[0].dday
        
        
        
        return cell}
    
    @IBAction func btnClicAct(_ sender: UIButton) {
        if self.tempUser == "개설자"{// 프로젝트 관리
            let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let secondAction: UIAlertAction = UIAlertAction(title: "프로젝트 삭제", style: UIAlertActionStyle.destructive) { action -> Void in
                deleteAct()}
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }
            //actionSheetController.addAction(firstAction)
            actionSheetController.addAction(secondAction)
            actionSheetController.addAction(cancelAction)
            present(actionSheetController, animated: true, completion: nil)
            func editAct(){// 수정
            }
            func deleteAct(){// 프로젝트 삭제
                let dialog = UIAlertController(title: "프로젝트 삭제", message: "삭제합니다.", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default){ action -> Void in
                    deleteComplete()
                }
                dialog.addAction(action)
                self.present(dialog, animated: true, completion: nil)
                func deleteComplete(){
                    CreateNewProjectService.projectDelete(tempURL: tempProjectId){ (message) in
                        if message == "delete success"{
                            print("delete sucess")
                            let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
                            let vc = storyboard.instantiateViewController(withIdentifier: "MyTabViewController") as! MyTabViewController
                            self.present(vc, animated: false, completion: nil)
                        }
                    }
                    // 화면전환
                    
                }
            }
            
        }
        else{ // 참여자인 경우
            let secondVC = UIStoryboard(name: "Apply", bundle:nil ).instantiateViewController(withIdentifier: "ProjectJoinViewController") as! ProjectJoinViewController
            secondVC.tempProjectId = self.tempProjectId
            secondVC.tempRecruitId = self.tempRecruitId
            
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
    
    var temp1 = ""
    var temp2 = ""
    var temp3 = ""
    var temp4 = ""
    
    @IBAction func applyBtnAct(_ sender: UIButton) {// 지원멤버 이동
        let secondVC = UIStoryboard(name: "Detail", bundle:nil ).instantiateViewController(withIdentifier: "ApplyMemberViewController") as! ApplyMemberViewController
        secondVC.tempRecruitIdx = tempRecruitId
        secondVC.temp1 = self.te1
        secondVC.temp2 = self.te2
        secondVC.temp3 = self.te3
        secondVC.temp4 = self.te4
        print("여기다여기")
        print(secondVC.tempRecruitIdx)
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    @IBAction func participateBtnAct(_ sender: UIButton) { // 참여멤버 // 항상 보이기
        let secondVC = UIStoryboard(name: "Detail", bundle:nil ).instantiateViewController(withIdentifier: "ProjectMemberViewController") as! ProjectMemberViewController
        
        secondVC.add = "5b4214e17042192fed3d1d0c"// tempProjectId
        
        self.navigationController?.pushViewController(secondVC, animated: true)
        
        // 프로젝트 id 넘겨줘야 한다.
    }
}














