//
//  MyPageViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let imageArray = [#imageLiteral(resourceName: "iconsTabbar1Home"), #imageLiteral(resourceName: "iconsTabbar1Home"), #imageLiteral(resourceName: "iconsTabbar1Home")]
    
    @IBOutlet weak var introductionCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        funcForNavigationBar()
    }
    func funcForNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "내 소개"
        let leftButtonItem = UIBarButtonItem(image: UIImage(named: "iconCaretLeftDarkgray"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(MyPageViewController.popAction))
        leftButtonItem.tintColor = UIColor.black
        
        let rightButtonItem = UIBarButtonItem(image: UIImage(named: "iconEditDarkgray"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(MyPageViewController.pushAction))
        rightButtonItem.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = rightButtonItem
        self.navigationItem.leftBarButtonItem = leftButtonItem
    }
    @objc func popAction() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func pushAction() {
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "MyPageUpdateViewController") as? MyPageUpdateViewController{
            
            
            //더 보기로 이동
            
            self.navigationController?.pushViewController(secondVC, animated: true)
            
            
        }
        
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroductionCollectionViewCell", for: indexPath) as! IntroductionCollectionViewCell
        cell.introductionImage.image = imageArray[indexPath.row]
        
        return cell
    }
}
