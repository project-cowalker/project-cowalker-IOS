//
//  ProjectIntroViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class ProjectIntroViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var projectCollectionView: UICollectionView!
    
    @IBOutlet weak var underBar: UIToolbar!
    
    
    
    var imageArray = [#imageLiteral(resourceName: "iconsTabbar1Home"), #imageLiteral(resourceName: "iconsTabbar1Home"), #imageLiteral(resourceName: "iconsTabbar1HomeSelected"), #imageLiteral(resourceName: "iconsTabbar1Home")]
    
    @IBOutlet weak var detailView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //모임 상세, 탭바 없애기
        self.title = "모임상세"
        self.tabBarController?.tabBar.isHidden = true
     
        
        let leftButton = UIBarButtonItem(title: "<Home", style: .plain, target: self, action: #selector(self.action))
        self.navigationItem.leftBarButtonItem = leftButton
        
        //self.navigationController?.isToolbarHidden = false
        
    }
    @objc func action(){
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // 컬랙션뷰
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count}
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCollectionViewCell", for: indexPath) as! ProjectCollectionViewCell
        cell.projectImage.image = imageArray[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width:self.view.frame.width   , height: 200*self.view.frame.height/677 )
            
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
    
    @IBAction func btnClickAct(_ sender: UIButton) {
        detailView.frame.size.height += 50
        
    }
    
}
