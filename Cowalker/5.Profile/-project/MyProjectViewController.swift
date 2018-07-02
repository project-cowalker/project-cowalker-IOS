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
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == createCollectionView{
            return imageArray.count
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == createCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateCollectionViewCell", for: indexPath) as! CreateCollectionViewCell
            cell.projectImage.image = imageArray[indexPath.row]
            
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
