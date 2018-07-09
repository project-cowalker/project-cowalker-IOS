//
//  HomeViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var pagingCollectionView: UICollectionView!
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    var imageArray = [#imageLiteral(resourceName: "iconsTabbar1Home"), #imageLiteral(resourceName: "iconsTabbar1Home"), #imageLiteral(resourceName: "iconsTabbar1Home")]
    var imageArray2 = [#imageLiteral(resourceName: "iconsTabbar2Search"),#imageLiteral(resourceName: "iconsTabbar1HomeSelected"), #imageLiteral(resourceName: "iconsTabbar2Search"),#imageLiteral(resourceName: "iconsTabbar1HomeSelected"), #imageLiteral(resourceName: "iconsTabbar2Search"), #imageLiteral(resourceName: "iconsTabbar2Search")]
    var label1 = ["1", "2", "3", "4", "5", "6"]
   // var window: UIWindow?
    
    @IBAction func logoutBtnAct(_ sender: UIButton) {
       // print("delete id, pwd")
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "pwd")/*
        // 데이터 삭제
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        vc.viewDidLoad()
        // 화면전환
        self.dismiss(animated: true, completion: nil)*/
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.tintColor = UIColor (red: 100.0/255.0, green: 223.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        self.tabBarController?.tabBar.items![0].image = #imageLiteral(resourceName: "iconsTabbar1Home")
        // 상단 없애기
        self.navigationController?.isNavigationBarHidden = true
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == pagingCollectionView{
            return imageArray.count
        }else{
            return imageArray2.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == pagingCollectionView{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PagingCollectionViewCell", for: indexPath) as! PagingCollectionViewCell
        cell.pageImageView.image = imageArray[indexPath.row]
            return cell}
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
            cell.listImageView.image = imageArray2[indexPath.row]
            cell.nameLabel.text = label1[indexPath.row]
            cell.partLabel.text = label1[indexPath.row]
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == pagingCollectionView{
            return CGSize(width:self.view.frame.width   , height: 200*self.view.frame.height/900 )
        }else{
            return CGSize(width:180*self.view.frame.height/375   , height: 180*self.view.frame.height/900  )
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    // 셀 클릭시 다음 화면으로 이동
    var projectDetails: [ProjectDetail] = [ProjectDetail]()
    var recruitLists: [RecruitList] = [RecruitList]()
    let temp: String = ""
    let tempToken = "5b3dd2387172d402215033d2"
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == listCollectionView{
            let secondVC = UIStoryboard(name: "Project", bundle:nil ).instantiateViewController(withIdentifier: "ProjectIntroViewController") as! ProjectIntroViewController
            // 서버 통신 1
            CreateNewProjectService.getProjectDeatil(project_idx: tempToken ){ (projectDetails, temp) in
                self.projectDetails = projectDetails
                secondVC.titleLabel.text = self.projectDetails[0].title
                //
                secondVC.tempProjectDetails = projectDetails
            }
            // 서버 통신 2 - 모집 관련 호출 // 통신 값을 다음 화면의 컬랙션에 출력해야된다.
            RecruitService.recruitList(add: tempToken){ (recruitLists) in
                self.recruitLists = recruitLists
                secondVC.titleLabel.text = self.recruitLists[0].position
                //
                secondVC.tempRecruitLists = recruitLists
            }
            self.navigationController?.pushViewController(secondVC, animated: true) // 화면전환
        }
    }
}













