//
//  HomeViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//
import UIKit
import Kingfisher

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var listCollectionView: UICollectionView!
    @IBOutlet weak var collectionConst: NSLayoutConstraint!
    
    override func viewDidLoad() {
     super.viewDidLoad()
        self.tabBarController?.tabBar.tintColor = UIColor (red: 100.0/255.0, green: 223.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        self.tabBarController?.tabBar.items![0].image = #imageLiteral(resourceName: "iconsTabbar1Home")
        self.navigationController?.isNavigationBarHidden = true // 상단 없애기
        homeInit()
        collectionConst.constant = collectionConst.constant + 8*(251) // 길이조정
    }
    var homeDetails: [HomeDetail] = [HomeDetail]()
    func homeInit(){
        HomeService.getHomeDeatil{ (homeDetails) in
            self.homeDetails = homeDetails
            self.listCollectionView.reloadData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return homeDetails.count}
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
      // cell.listImageView?.kf.setImage(with: URL(string: gsno(homeDetails[indexPath.row].img_url?[0])), placeholder: UIImage())
            cell.nameLabel.text = homeDetails[indexPath.row].title
            cell.partLabel.text = homeDetails[indexPath.row].area
            return cell
    } // 클릭
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == listCollectionView{
            let secondVC = UIStoryboard(name: "Project", bundle:nil ).instantiateViewController(withIdentifier: "ProjectIntroViewController") as! ProjectIntroViewController
                secondVC.tempProjectId = homeDetails[indexPath.row]._id!
            self.navigationController?.pushViewController(secondVC, animated: true) 
        }
    }
}
// 기존 셀 4개 = 2줄
// reload ->2줄, 2줄, 2줄, 2줄 // 총 10줄 까지




