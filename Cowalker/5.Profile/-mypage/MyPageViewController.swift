//
//  MyPageViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit
import Kingfisher

class MyPageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    
    @IBOutlet weak var introductionCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return imageArray.count
//        return introPage.intro_img_url!.count
//        if !(introPage.intro_img_url?.isEmpty ?? true){
//            return introPage.intro_img_url!.count
//        }else{
//            return 0
//        }
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        funcForNavigationBar()
        initIntroPage()
    }
    override func viewWillAppear(_ animated: Bool) {
        initIntroPage()
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
            
            
            
            self.navigationController?.pushViewController(secondVC, animated: true)
            
            
        }
        
        
    }
    var temp  = 1
    var imageArray: [String] = []
    //자신이 더보기 누른 경우
    var introPage: IntroPage!
    func initIntroPage(){
        MypageService.seeMyPageMySelf(urlTemp: "") { (IntroPage) in
            self.introPage = IntroPage
            self.textView.text = self.introPage.intro_contents!
            self.introductionCollectionView.reloadData()
            self.temp = IntroPage.intro_img_url!.count
            self.imageArray = IntroPage.intro_img_url!
            print(self.imageArray)
        }
        
      
    }

    @IBOutlet weak var textView: UITextView!
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroductionCollectionViewCell", for: indexPath) as! IntroductionCollectionViewCell
      
        cell.introductionImage.kf.setImage(with: URL(string: gsno(imageArray[indexPath.row])), placeholder: #imageLiteral(resourceName: "1.png"))
        
        
////        if !(introPage.intro_img_url?.isEmpty ?? true){
//            cell.introductionImage.kf.setImage(with: URL(string: gsno(imageArray[indexPath.row])), placeholder: #imageLiteral(resourceName: "1.png"))
//        }
//
        
//        if !(participateProject[indexPath.row].img_url?.isEmpty ?? true) {
//            cell.projectImage.kf.setImage(with: URL(string: gsno(participateProject[indexPath.row].img_url?[0])), placeholder: #imageLiteral(resourceName: "1.png"))
//        }

//        cell.introductionImage.kf.setImage(with: URL(string: gsno(imageArray[indexPath.row])), placeholder: UIImage())
//
//        cell.introductionImage.kf.setImage(with: URL(string: gsno(imageArray[indexPath.row])), placeholder: UIImage())
        
        
        return cell
    }
}
