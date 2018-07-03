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
    ///////////////////컬랙션 뷰 클릭하면 이동
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == listCollectionView{
        let secondVC = UIStoryboard(name: "Home", bundle:nil ).instantiateViewController(withIdentifier: "ProjectIntroViewController") as! ProjectIntroViewController
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
    
}



















