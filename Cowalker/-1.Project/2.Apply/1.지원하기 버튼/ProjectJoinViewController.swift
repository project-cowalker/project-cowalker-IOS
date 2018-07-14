//
//  ProjectJoinViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

//////////////// 참여자일 때
class ProjectJoinViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate , UITextFieldDelegate{

    @IBOutlet weak var partCollectionView: UICollectionView!
    
    //변수
    @IBOutlet weak var introTf: UITextField!
    @IBOutlet weak var portfolioTf: UITextField!
    @IBOutlet weak var phoneTf: UITextField!
    
    @IBOutlet weak var questionTf: UITextField!
    @IBOutlet weak var question2Tf: UITextField!
    
    @IBOutlet weak var collectiViewH: NSLayoutConstraint!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "지원하기"
        introTf.text = ""
        portfolioTf.text = ""
        phoneTf.text = ""
        questionTf.text = ""
        question2Tf.text = ""
        collectionInit()
        funcForNavigationBar()
    }
    
    func funcForNavigationBar(){
        //self.navigationController?.isNavigationBarHidden = false // 상단 바 보이게
        //self.tabBarController?.tabBar.isHidden = true // 하단 탭바 삭제
        let leftButtonItem = UIBarButtonItem(image: UIImage(named: "iconCaretLeftDarkgray"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(popAction))
        leftButtonItem.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = leftButtonItem}
    
    @objc func popAction(){ // 뒤로가기 버튼
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = false}
    
    
    
    var tempRecruitLists : [RecruitList] = [RecruitList]()
    var tempList = 0
    
    func collectionInit(){
        RecruitService.recruitList(add: tempProjectId){ (recruitLists) in
            self.tempRecruitLists = recruitLists
            self.tempList = self.tempRecruitLists.count
            self.const() // 모집컬랙션뷰 크기 처리함수
            self.partCollectionView.reloadData()
        }
    }
    @IBOutlet weak var collecViewH: NSLayoutConstraint!
    //
    func const(){
        if tempList == 0{
            collecViewH.constant = 30
        }
        else{ collecViewH.constant = CGFloat((tempList - 1)*88) + collecViewH.constant
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true}
    
    // 컬랙션 뷰
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return tempList
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartJoinCollectionViewCell", for: indexPath) as! PartJoinCollectionViewCell
        
        cell.partLabel.text = tempRecruitLists[indexPath.row].position
        cell.partNumLabel.text = String(self.tempRecruitLists[indexPath.row].number) + "명"
        cell.dDayLabel.text =  "D " + self.tempRecruitLists[indexPath.row].dday
        cell.detailLabel.text = self.tempRecruitLists[indexPath.row].task
        
        if selectedIndex == indexPath.row
        {
            cell.backgroundColor = UIColor.white
            self.tempRole = self.tempRecruitLists[0].position
        }
        else
        {
            cell.backgroundColor = UIColor.lightGray /// 수정하기
        }
        return cell
    }
    //셀 클릭시
    
    var selectedIndex = Int ()
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 클릭한 셀만 그대로, 나머지 셀은 흐려지기
        
        selectedIndex = indexPath.row
        
        self.partCollectionView.reloadData()
    }
    
    
    //
    var tempRecruitId = ""
    var tempProjectId = ""
    var tempRole = ""
    
    // 참여하기 버튼
    @IBAction func btnAct(_ sender: UIButton) {

        // 리크룻아이디, 프로젝트 아이디 전송해야한다. /////
        // 서버 통신
        ApplyService.applyWrite(introduce: introTf.text!, portfolio_url: portfolioTf.text!, phone: phoneTf.text!, recruit_idx: tempRecruitId, project_idx: tempProjectId, position: tempRole , answers: [questionTf.text!,question2Tf.text!] ) { (message) in
            if message == "success"{
                print("ㅅㅂ됐다")
            }else if message == "database failure"{
            }else{
            }
        }
        // 화면 전환
    self.popBack(toControllerType: ProjectIntroViewController.self)
        
        //self.navigationController?.popViewController(animated: true)
        
        // 돌아가면서 작업하기, 뒤로가면서 리로드 되는가 ?
    
        // 무조건 홈화면으로 ?
        // secondVC = UIStoryboard(name: "Project", bundle:nil ).instantiateViewController(withIdentifier: "ProjectIntroViewController") as! ProjectIntroViewController
        
       // self.navigationController?.pushViewController(secondVC, animated: true)
        
        
    }
    // 특정 뷰로 이동 
    func popBack<T: UIViewController>(toControllerType: T.Type) {
        if var viewControllers: [UIViewController] = self.navigationController?.viewControllers {
            viewControllers = viewControllers.reversed()
            for currentViewController in viewControllers {
                if currentViewController .isKind(of: toControllerType) {
                    self.navigationController?.popToViewController(currentViewController, animated: true)
                    break
                }
            }
        }
    }

}

















