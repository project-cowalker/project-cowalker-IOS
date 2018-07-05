//
//  ProjectJoinViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class ProjectJoinViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    //변수
    @IBOutlet weak var projectCollectionView: UICollectionView!
    
    @IBOutlet weak var introTf: UIView!
    @IBOutlet weak var portfolioTf: UITextField!
    @IBOutlet weak var recruitTf: UITextField!
    @IBOutlet weak var questionTf: UITextField!
    
    @IBOutlet weak var question2Tf: UITextField!
    
    var partList = ["개발자","디자이너","기획자","디자이너","개발자", "디자이너"]
    var numList = ["1", "2", "3", "4", "5", "6"]
    var ddayList = ["1", "2", "3", "4", "5", "6"]
    var detailList = ["ㅇ", "ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅇ"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // 컬랙션 뷰
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return partList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartCollectionViewCell", for: indexPath) as! PartCollectionViewCell
        
        cell.partLabel.text = partList[indexPath.row]
        cell.partNumLabel.text = numList[indexPath.row]
        cell.dDayLabel.text = ddayList[indexPath.row]
        cell.detailLabel.text = detailList[indexPath.row]
        
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width:self.view.frame.width   , height: 375*self.view.frame.height/677)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // 버튼
    
    @IBAction func btnAct(_ sender: UIButton) {
        /*
        ApplyService.applyInit(introduce: self.introTf.text, portfolio_url: self.portfolioTf.text, recruit_idx: self.recruitTf.text, question: self.introTf.text ) { (message) in)
    
            if message == "success"{
                
            }else if message == "database failure"{
                
            }else{ // 권한 없은
                
            }
        }*/
}

}

















