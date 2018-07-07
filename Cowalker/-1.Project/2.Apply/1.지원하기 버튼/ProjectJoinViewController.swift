//
//  ProjectJoinViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit


//////////////// 참여자일 때
class ProjectJoinViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var partCollectionView: UICollectionView!
    
    //변수
    @IBOutlet weak var introTf: UITextField!
    @IBOutlet weak var portfolioTf: UITextField!
    @IBOutlet weak var phoneTf: UITextField!
    
    @IBOutlet weak var questionTf: UITextField!
    @IBOutlet weak var question2Tf: UITextField!
    
    
    var partList = ["개발자","디자이너","기획자","디자이너"]//,"개발자", "디자이너"]
    var numList = ["1명", "2명", "3명", "4명", "5명", "6명"]
    var ddayList = ["D - 1", "D - 2", "D - 3", "D - 4", "D - 5", "D - 6"]
    var detailList = ["웹,앱 서비스 개발", "로고 및 앱 디자인", "웹,앱 서비스 개발", "웹,앱 서비스 개발", "웹,앱 서비스 개발"]

    @IBOutlet weak var collectiViewH: NSLayoutConstraint!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectiViewH.constant = CGFloat((self.partList.count - 1)*88) + collectiViewH.constant
    }
    // 컬랙션 뷰
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return partList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartJoinCollectionViewCell", for: indexPath) as! PartJoinCollectionViewCell
        cell.partLabel.text = partList[indexPath.row]
        cell.partNumLabel.text = numList[indexPath.row]
        cell.dDayLabel.text = ddayList[indexPath.row]
        cell.detailLabel.text = detailList[indexPath.row]
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
    
    // 참여하기 버튼
    @IBAction func btnAct(_ sender: UIButton) {
        
        
        /*
        // 서버 통신
        ApplyService.applyNew(introduce: "", portfolio_url: "", phone: "", recruit_idx: "", project_idx: "", position: "", answers: ["",""] ) { (message) in

            if message == "success"{
                print("sc")
            }else if message == "database failure"{
                
            }else{ // 권한 없은
                
            }
        }*/
        
        // 화면 전환
    self.navigationController?.popViewController(animated: true)
    }
}

















