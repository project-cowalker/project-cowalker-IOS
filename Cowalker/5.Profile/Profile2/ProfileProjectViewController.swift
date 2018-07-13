//
//  ProfileProjectViewController.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 10..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class ProfileProjectViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == createCollectionView {
            return madeProject.count
        }else{
            return participateProject.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == createCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MadeCollectionViewCell", for: indexPath) as! MadeCollectionViewCell
            cell.nameLabel.text = madeProject[indexPath.row].title
            cell.contentLabel.text = madeProject[indexPath.row].department
            //            if let temp = madeProject[indexPath.row].img_url![0]{
            //                    cell.projectImage.kf.setImage(with: URL(string: gsno(temp)), placeholder: UIImage())
            //            }
            return cell
            
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JoinCollectionViewCell", for: indexPath) as! JoinCollectionViewCell
            cell.nameLabel.text = madeProject[indexPath.row].title
            cell.contentLabel.text = madeProject[indexPath.row].department
            //            if let temp = madeProject[indexPath.row].img_url![0]{
            //                    cell.projectImage.kf.setImage(with: URL(string: gsno(temp)), placeholder: UIImage())
            //            }
            return cell
        }
    }

    @IBOutlet weak var createCollectionView: UICollectionView!
    @IBOutlet weak var doingCollectionView: UICollectionView!
    
    
    var madeProject: [IMadeProject] = [IMadeProject]()
    func putMadeProject(url: String){
        MypageService.iMadeProject(urlTemp: "/"+url) { (MadeProject) in
            self.madeProject = MadeProject
            self.createCollectionView.reloadData()
        }
    }
    var participateProject: [ParticipatedProject] = [ParticipatedProject]()
    func putDoingProject(url: String){
        MypageService.participateProject(urlTemp: "/apply/enter_project/"+url) { (ParticipatedProject) in
            self.participateProject = ParticipatedProject
            self.doingCollectionView.reloadData()
            
        }
    }
    var user_idx: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        putMadeProject(url: user_idx!)
        putDoingProject(url: user_idx!)
        funcForNavigationBar()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func funcForNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "프로젝트"
        let leftButtonItem = UIBarButtonItem(image: UIImage(named: "iconCaretLeftDarkgray"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(ProfileProjectViewController.popAction))
        leftButtonItem.tintColor = UIColor.black
        
        self.navigationItem.leftBarButtonItem = leftButtonItem
    }
    @objc func popAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    var temp: String = String()
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == createCollectionView {
            
            temp = madeProject[indexPath.row].project_idx!
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Project", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ProjectIntroViewController") as! ProjectIntroViewController
            vc.tempProjectId = temp
            self.present(vc, animated: true,completion: nil)
        }else {
            
            temp = participateProject[indexPath.row]._id!
            let storyboard: UIStoryboard = UIStoryboard(name: "Project", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ProjectIntroViewController") as! ProjectIntroViewController
            vc.tempProjectId = temp
            self.present(vc, animated: true,completion: nil)
        }
    }
    

}
