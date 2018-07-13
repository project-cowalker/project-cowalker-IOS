//
//  HomeViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//
//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& reload 처라
import UIKit
import Kingfisher

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var listCollectionView: UICollectionView!
    @IBOutlet weak var collectionConst: NSLayoutConstraint!
    
    //var refreshControl: UIRefreshControl!
    override func viewDidLoad() {
     super.viewDidLoad()
        self.tabBarController?.tabBar.tintColor = UIColor (red: 69.0/255.0, green: 182.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        self.tabBarController?.tabBar.items![0].image = #imageLiteral(resourceName: "iconsTabbar1Home")
        self.navigationController?.isNavigationBarHidden = true // 상단 없애기
        homeInit()
        //collectionConst.constant = collectionConst.constant + 6*(251)} // 길이조정
    }
    var homeDetails: [HomeDetail] = [HomeDetail]()
    func homeInit(){
        HomeService.getHomeDeatil{ (homeDetails) in
            self.homeDetails = homeDetails
            self.listCollectionView.reloadData()
            if (homeDetails.count%2 == 0) {
                self.collectionConst.constant = CGFloat(homeDetails.count)/2*251
            }else{
                self.collectionConst.constant = CGFloat(homeDetails.count+1)/2*251
            }
        }
    }
    // 콜랙션
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if homeDetails.count > 20{
            return 20
        }else{
            return homeDetails.count
        }}
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
    cell.listImageView?.kf.setImage(with: URL(string: gsno(homeDetails[indexPath.row].img_url?[0])), placeholder: UIImage())
            cell.nameLabel.text = homeDetails[indexPath.row].title
        cell.partLabel.text = homeDetails[indexPath.row].aim! + "•" + homeDetails[indexPath.row].department! + "•" + homeDetails[indexPath.row].area!
            return cell
    } // 클릭
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == listCollectionView{
            let secondVC = UIStoryboard(name: "Project", bundle:nil ).instantiateViewController(withIdentifier: "ProjectIntroViewController") as! ProjectIntroViewController
            secondVC.tempProjectId = homeDetails[indexPath.row]._id!
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
    //
    @IBAction func testBtnClick(_ sender: UIButton) {
        let secondVC = UIStoryboard(name: "Project", bundle:nil ).instantiateViewController(withIdentifier: "ProjectIntroViewController") as! ProjectIntroViewController
      // secondVC.tempProjectId = homeDetails[indexPath.row]._id!
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

