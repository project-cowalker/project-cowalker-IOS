//
//  MyProjectViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit


class MyProjectViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let imageArray = [#imageLiteral(resourceName: "iconsTabbar1Home"), #imageLiteral(resourceName: "iconsTabbar1Home"), #imageLiteral(resourceName: "iconsTabbar1Home")]
    
    @IBOutlet weak var createCollectionView: UICollectionView!
    @IBOutlet weak var doingCollectionView: UICollectionView!
    @IBOutlet weak var applyingCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        funcForNavigationBar()
        putMadeProject()
        putDoingProject()
        putAppliedProject()
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
            return participateProject.count
        }else{
            return appliedProject.count
        }
    }
    
    func collectionViewInit(){
        createCollectionView.dataSource = self; createCollectionView.delegate = self
        doingCollectionView.dataSource = self; doingCollectionView.delegate = self
        applyingCollectionView.dataSource = self; applyingCollectionView.delegate = self
        
    }
    var madeProject: [IMadeProject] = [IMadeProject]()
    func putMadeProject(){
        MypageService.iMadeProject(urlTemp: "") { (MadeProject) in
            self.madeProject = MadeProject
            self.createCollectionView.reloadData()
        }
    }
    var participateProject: [ParticipatedProject] = [ParticipatedProject]()
    func putDoingProject(){
        MypageService.participateProject(urlTemp: "/apply/enter_project") { (ParticipatedProject) in
            self.participateProject = ParticipatedProject
            self.doingCollectionView.reloadData()
            
        }
    }
    var appliedProject: [ParticipatedProject] = [ParticipatedProject]()
    func putAppliedProject(){
        MypageService.participateProject(urlTemp: "/apply/apply_project") { (appliedProject) in
            self.appliedProject = appliedProject
            self.applyingCollectionView.reloadData()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == createCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateCollectionViewCell", for: indexPath) as! CreateCollectionViewCell
            cell.projectName.text = madeProject[indexPath.row].title
            cell.projectPart.text = madeProject[indexPath.row].department
            if !(madeProject[indexPath.row].img_url?.isEmpty ?? true) {
                cell.projectImage.kf.setImage(with: URL(string: gsno(madeProject[indexPath.row].img_url?[0])), placeholder: #imageLiteral(resourceName: "1.png"))
            }
            
            return cell
            
        }else if collectionView == doingCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DoingCollectionViewCell", for: indexPath) as! DoingCollectionViewCell
           
            cell.projectName.text = participateProject[indexPath.row].title
            cell.projectPart.text = participateProject[indexPath.row].department
            if !(participateProject[indexPath.row].img_url?.isEmpty ?? true) {
                cell.projectImage.kf.setImage(with: URL(string: gsno(participateProject[indexPath.row].img_url?[0])), placeholder: #imageLiteral(resourceName: "1.png"))
            }
            return cell
            
            
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ApplyingCollectionViewCell", for: indexPath) as! ApplyingCollectionViewCell
            cell.projectName.text = appliedProject[indexPath.row].title
            cell.projectPart.text = appliedProject[indexPath.row].department
            if !(appliedProject[indexPath.row].img_url?.isEmpty ?? true) {
                cell.projectImage.kf.setImage(with: URL(string: gsno(appliedProject[indexPath.row].img_url?[0])), placeholder: #imageLiteral(resourceName: "1.png"))
            }
            
            return cell
        }
        
    }
    
    
}
