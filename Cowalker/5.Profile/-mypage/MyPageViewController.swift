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

    var imageArray:[String] = [String]()
    
    @IBOutlet weak var introductionCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if temp != 0 {
            return temp
        }else{
            return 1
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        funcForNavigationBar()
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
            
            secondVC.intro_idx = introPage[0].intro_idx
            //더 보기로 이동
            
            self.navigationController?.pushViewController(secondVC, animated: true)
            
            
        }
        
        
    }
    var temp  = 1
    //자신이 더보기 누른 경우
    var introPage: [IntroPage] = [IntroPage]()
    func initIntroPage(){
        MypageService.seeMyPageMySelf(urlTemp: "") { (IntroPage) in
            self.introPage = IntroPage
            
            self.textView.text = self.introPage[0].intro_contents
            self.temp = (self.introPage[0].intro_img_url?.count)!
            if let tem_url = self.introPage[0].intro_img_url{
                self.imageArray = tem_url
            }
            print(self.temp)
            print(self.imageArray)
            self.introductionCollectionView.reloadData()
        }
        
      
    }

    @IBOutlet weak var textView: UITextView!
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroductionCollectionViewCell", for: indexPath) as! IntroductionCollectionViewCell

        cell.introductionImage.kf.setImage(with: URL(string: gsno(imageArray[indexPath.row])), placeholder: UIImage())
//
//        cell.introductionImage.kf.setImage(with: URL(string: gsno(imageArray[indexPath.row])), placeholder: UIImage())
        
        
        return cell
    }
}
