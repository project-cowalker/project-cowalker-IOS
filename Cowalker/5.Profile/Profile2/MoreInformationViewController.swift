//
//  MoreInformationViewController.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 11..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class MoreInformationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    var temp = 0
    var imageArray: [String] = [String]()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if temp != 0 {
            return temp
        }else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreInformationCollectionViewCell", for: indexPath) as! MoreInformationCollectionViewCell
        
        cell.moreInformationImage.kf.setImage(with: URL(string: gsno(imageArray[indexPath.row])), placeholder: UIImage())
        return cell
    }
    
    var user_idx: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initIntroPage()
        funcForNavigationBar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var introductionCollectionView: UICollectionView!
    
    
    @IBOutlet weak var textView: UITextView!
    
    var introPage: [IntroPage] = [IntroPage]()
    func initIntroPage(){
        MypageService.seeMyPageMySelf(urlTemp: "/"+user_idx!) { (IntroPage) in
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
    func funcForNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "내 소개"
        let leftButtonItem = UIBarButtonItem(image: UIImage(named: "iconCaretLeftDarkgray"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(ProfileProjectViewController.popAction))
        leftButtonItem.tintColor = UIColor.black
        
        self.navigationItem.leftBarButtonItem = leftButtonItem
    }
    @objc func popAction() {
        self.navigationController?.popViewController(animated: true)
    }
    

}
