//
//  ProjectPartDetailViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class ProjectPartDetailViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var partCollectionView: UICollectionView!

    var partList = ["개발자","디자이너","기획자","디자이너"]//,"개발자", "디자이너"]
    var numList = ["1명", "2명", "3명", "4명", "5명", "6명"]
    var ddayList = ["D - 1", "D - 2", "D - 3", "D - 4", "D - 5", "D - 6"]
    var detailList = ["웹,앱 서비스 개발", "로고 및 앱 디자인", "웹,앱 서비스 개발", "웹,앱 서비스 개발", "웹,앱 서비스 개발"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return partList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCollectionViewCell", for: indexPath) as! detailCollectionViewCell
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
    
    // 화면 전환
    @IBAction func btnClickAct(_ sender: UIButton) {
        let secondVC = UIStoryboard(name: "Home", bundle:nil ).instantiateViewController(withIdentifier: "ProjectMemberViewController") as! ProjectMemberViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    @IBAction func JoinBtnAct(_ sender: UIButton) {
        let secondVC = UIStoryboard(name: "Home", bundle:nil ).instantiateViewController(withIdentifier: "ProjectJoinViewController") as! ProjectJoinViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
}
