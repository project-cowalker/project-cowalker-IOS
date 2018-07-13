//
//  GetMoreInformationViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 12..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class GetMoreInformationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroductionCollectionViewCell", for: indexPath) as! IntroductionCollectionViewCell
        cell.introductionImage.kf.setImage(with: URL(string: gsno(imageArray[indexPath.row])), placeholder: #imageLiteral(resourceName: "1.png"))
        return cell
    }

    var temp = 0
    var imageArray: [String] = [String]()
    var user_idx: Int?
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
    
    var introPage: IntroPage!
    
    func initIntroPage(){
        MypageService.seeMyPageMySelf(urlTemp: "/"+String(user_idx!)) { (IntroPage) in
            
            self.introPage = IntroPage
            self.textView.text = self.introPage.intro_contents!
            self.introductionCollectionView.reloadData()
            self.imageArray = IntroPage.intro_img_url!
            
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
