//
//  ProjectIntroViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class ProjectIntroViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var barJoinBtn: UIBarButtonItem!
    @IBOutlet weak var projectCollectionView: UICollectionView!
    @IBOutlet weak var underBar: UIToolbar!
    
    @IBOutlet weak var clickBtn: UIImageView!
    
    
    @IBOutlet weak var partCollectionView: UICollectionView!
    var imageArray = [#imageLiteral(resourceName: "iconsTabbar1Home"), #imageLiteral(resourceName: "iconsTabbar1Home"), #imageLiteral(resourceName: "iconsTabbar1HomeSelected"), #imageLiteral(resourceName: "iconsTabbar1Home")]
    
    var check = 0
    
    //
    var partList = ["개발자","디자이너","기획자","디자이너","개발자", "디자이너"]
    var numList = ["1", "2", "3", "4", "5", "6"]
    var ddayList = ["1", "2", "3", "4", "5", "6"]
    var detailList = ["ㅇ", "ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅇ"]

    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true//상단 무
     /*
        let leftButton = UIBarButtonItem(title: "<Home", style: .plain, target: self, action: #selector(self.action))
        self.navigationItem.leftBarButtonItem = leftButton*/ //왼쪽버튼
    //self.navigationController?.isToolbarHidden = false 하단 없앵ㅁ
        
                constBtn.constant = -50
        
        let icon = #imageLiteral(resourceName: "btnJoinProject")
        let iconSize = CGRect(origin: CGPoint.zero, size: CGSize(width: 100, height: 50))
        let iconButton = UIButton(frame: iconSize)
        iconButton.setBackgroundImage(icon, for: .normal)
        let barButton = UIBarButtonItem(customView: iconButton)
        barJoinBtn = barButton
       
        
    }
    @objc func action(){
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    @IBAction func leftBtnAct(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    // 컬랙션뷰
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == projectCollectionView {
            return imageArray.count}
        else{
            return partList.count
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == projectCollectionView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCollectionViewCell", for: indexPath) as! ProjectCollectionViewCell
        cell.projectImage.image = imageArray[indexPath.row]
            return cell
            
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartCollectionViewCell", for: indexPath) as! PartCollectionViewCell
            
            
            cell.partLabel.text = partList[indexPath.row]
            cell.partNumLabel.text = numList[indexPath.row]
            cell.dDayLabel.text = ddayList[indexPath.row]
            cell.detailLabel.text = detailList[indexPath.row]
            
            return cell
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        
        if collectionView == projectCollectionView {
            return CGSize(width:self.view.frame.width   , height: 375*self.view.frame.height/677 )}
        else{
            return CGSize(width: 200*self.view.frame.width/375   , height: 50*self.view.frame.height/677 )
        }
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    // 버튼 이동
    @IBAction func detailBtnAction(_ sender: UIButton) {
        let secondVC = UIStoryboard(name: "Home", bundle:nil ).instantiateViewController(withIdentifier: "ProjectDetailViewController") as! ProjectDetailViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    @IBAction func fullBtnAction(_ sender: UIButton) {
        let secondVC = UIStoryboard(name: "Home", bundle:nil ).instantiateViewController(withIdentifier: "ProjectFullViewController") as! ProjectFullViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    @IBAction func partBtnAction(_ sender: UIButton) {
        let secondVC = UIStoryboard(name: "Home", bundle:nil ).instantiateViewController(withIdentifier: "ProjectPartViewController") as! ProjectPartViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    @IBAction func shareBtnAction(_ sender: UIButton) {
        let shareTxt = "텍스트"
        let shareImg = #imageLiteral(resourceName: "iconsTabbar2Search")
        let shareItems = [shareTxt, shareImg] as [Any]
        let activityController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        self.present(activityController, animated: true, completion:  nil)
    }
    @IBAction func JoinBtnAct(_ sender: UIButton) {
        
        let secondVC = UIStoryboard(name: "Home", bundle:nil ).instantiateViewController(withIdentifier: "ProjectJoinViewController") as! ProjectJoinViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @IBOutlet weak var constBtn: NSLayoutConstraint!
    @IBAction func btnClickAct(_ sender: UIButton) {
        if check == 0 {
            check = 1
            constBtn.constant = 5
            clickBtn.image = #imageLiteral(resourceName: "iconCaretUpBlue")
            sender.titleLabel?.text = "더 보기"
        }else if check == 1 {
            check = 0
            constBtn.constant = -50
           
            clickBtn.image = #imageLiteral(resourceName: "iconCaretDownBlue")
            sender.titleLabel?.text = "열기"
        }
        
        
    }
    
}
