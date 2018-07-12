//
//  ResumeViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 7..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class ResumeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var tempApplyId = "" // 이전뷰에서 모두 전달받음
    var tempApplicantId = ""
 
    @IBOutlet weak var resumePartCollectionView: UICollectionView!
    var resumeDetails: [resumeDetail] = [resumeDetail]()
    //
    
    @IBOutlet weak var introductLabel: UILabel!
    @IBOutlet weak var portfolioLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var answer1: UILabel!
    @IBOutlet weak var answer2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "이력서"
        resumeInit()
        recommendInit()
    }
    
    func resumeInit(){
        ResumeService.resumeInit(a: tempApplyId, b: tempApplicantId){ (resumedetails) in
            self.resumeDetails = resumedetails
            
            self.dataInit()
            //self.btnInit()
            self.resumePartCollectionView.reloadData()
        }
    }
    func recommendInit(){
        
    }
    func dataInit(){
        self.introductLabel.text = self.resumeDetails[0].introduce
        self.portfolioLabel.text = self.resumeDetails[0].portfolio_url
        self.phoneLabel.text = self.resumeDetails[0].phone
        self.answer1.text = self.resumeDetails[0].answers[0]
        self.answer2.text = self.resumeDetails[0].answers[1]
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    var temp1 = ""
    var temp2 = ""
    var temp3 = ""
    var temp4 = ""
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resumePartCollectionViewCell", for: indexPath) as! resumePartCollectionViewCell
        
       cell.partLabel.text = temp1
        cell.numberLabel.text = temp2
        cell.todoLabel.text = temp3
        cell.dayLabel.text = temp4
        
        return cell
    }
}
