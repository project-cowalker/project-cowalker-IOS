//
//  MyProjectViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit


class MyProjectViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var madeProject: [IMadeProject] = [IMadeProject]()
    let imageArray = [#imageLiteral(resourceName: "iconsTabbar1Home"), #imageLiteral(resourceName: "iconsTabbar1Home"), #imageLiteral(resourceName: "iconsTabbar1Home")]
    
    @IBOutlet weak var createCollectionView: UICollectionView!
    @IBOutlet weak var doingCollectionView: UICollectionView!
    @IBOutlet weak var applyingCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        funcForNavigationBar()
        putMadeProject()
        
    }
    func funcForNavigationBar(){
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "프로젝트"
        let leftButtonItem = UIBarButtonItem(image: UIImage(named: "iconCaretLeftDarkgray"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(MyProjectViewController.popAction))
        leftButtonItem.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = leftButtonItem
        
    }
    @objc func popAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == createCollectionView{
            return madeProject.count
        }else if collectionView == doingCollectionView{
            return imageArray.count
        }else{
            return imageArray.count
        }
    }
    
    func collectionViewInit(){
        createCollectionView.dataSource = self; createCollectionView.delegate = self
        doingCollectionView.dataSource = self; doingCollectionView.delegate = self
        applyingCollectionView.dataSource = self; applyingCollectionView.delegate = self
        
    }
    func putMadeProject(){
        MypageService.iMadeProject { (MadeProject) in
            self.madeProject = MadeProject
            self.createCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == createCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateCollectionViewCell", for: indexPath) as! CreateCollectionViewCell
            cell.projectName.text = madeProject[indexPath.row].title
            cell.projectPart.text = madeProject[indexPath.row].department
//            if let temp = madeProject[indexPath.row].img_url![0]{
//                    cell.projectImage.kf.setImage(with: URL(string: gsno(temp)), placeholder: UIImage())
//            }
            
            return cell
            
        }else if collectionView == doingCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DoingCollectionViewCell", for: indexPath) as! DoingCollectionViewCell
            cell.projectImage.image = imageArray[indexPath.row]
            
            return cell
            
            
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ApplyingCollectionViewCell", for: indexPath) as! ApplyingCollectionViewCell
            cell.projectImage.image = imageArray[indexPath.row]
            
            return cell
        }
        
    }
    
    
}
