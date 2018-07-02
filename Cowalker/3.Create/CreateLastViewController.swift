//
//  CreateLastViewController.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class CreateLastViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var imageForProject =  [#imageLiteral(resourceName: "btnAddPic")]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageForProject.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateImageCollectionViewCell", for: indexPath) as! CreateImageCollectionViewCell
        cell.projectImage.image = imageForProject[indexPath.row]
        
        return cell
    }
    @IBOutlet weak var viewForProject: UICollectionView!
    

    override func viewDidLoad() {
        viewForProject.dataSource = self
        viewForProject.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
