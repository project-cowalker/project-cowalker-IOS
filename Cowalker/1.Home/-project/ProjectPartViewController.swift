//
//  ProjectPartViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class ProjectPartViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var partCollecvionView: UICollectionView!
    
    var partList = ["개발자","디자이너","기획자","디자이너","개발자", "디자이너"]
    var numList = ["1", "2", "3", "4", "5", "6"]
    var ddayList = ["1", "2", "3", "4", "5", "6"]
    var detailList = ["ㅇ", "ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅇ"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "모집 보기"
    }
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
            return CGSize(width:250*self.view.frame.width/375   , height: 90*self.view.frame.height/667 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    // 셀 클릭, 화면전환
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
            let secondVC = UIStoryboard(name: "Home", bundle:nil ).instantiateViewController(withIdentifier: "ProjectPartDetailViewController") as! ProjectPartDetailViewController
            self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @IBAction func JoinBtnAct(_ sender: UIButton) {
        let secondVC = UIStoryboard(name: "Home", bundle:nil ).instantiateViewController(withIdentifier: "ProjectJoinViewController") as! ProjectJoinViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
    
    

}


























