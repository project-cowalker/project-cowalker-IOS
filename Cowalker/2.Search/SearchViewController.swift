//
//  SearchViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.tintColor = UIColor (red: 100.0/255.0, green: 223.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        self.tabBarController?.tabBar.items![1].image = #imageLiteral(resourceName: "iconsTabbar2Search")
        self.navigationController?.isNavigationBarHidden = true
        initSearch()
    }
    
    // 임이 데이터
    let imageArray = [#imageLiteral(resourceName: "iconsTabbar1Home"), #imageLiteral(resourceName: "iconsTabbar1Home"), #imageLiteral(resourceName: "iconsTabbar1Home"), #imageLiteral(resourceName: "iconsTabbar1Home"), #imageLiteral(resourceName: "iconsTabbar1Home"), #imageLiteral(resourceName: "iconsTabbar5Mypage"), #imageLiteral(resourceName: "iconsTabbar5Mypage"), #imageLiteral(resourceName: "iconsTabbar5Mypage")]
    let textArray = ["1", "2", "3", "4","1", "2", "3", "4", "1", "2", "3", "4"]
  
    @IBOutlet weak var projectCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchData.count
    }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "projectCollectionViewCell", for: indexPath) as! projectCollectionViewCell
//        cell.imgView.image = imageArray[indexPath.row]
        // nill 인거 거르기~~~~~~~~~~~~~~~~~~~~~~~~
        cell.labelText1.text = searchData[indexPath.row].title!
        cell.labelText2.text = searchData[indexPath.row].aim!
//        cell.labelText1.text = textArray[indexPath.row]
//        cell.labelText2.text = textArray[indexPath.row]
        return cell
    
    }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:180*self.view.frame.width/375   , height: 180*self.view.frame.height/667 )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
}
    ////////////////검색필터
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func filterBtnAct(_ sender: UIButton) {
        //필터뷰 오픈, 프리젠트
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "FilterViewController")
        
        present(nextView, animated: true, completion: nil)
        
    }
    @IBAction func searchBtnAct(_ sender: UIButton) {
        //서치 뷰
    }
    
    var searchData: [Search] = [Search]()
    func initSearch(){
        SearchServie.searchInit { (Search) in
            self.searchData = Search
            self.projectCollectionView.reloadData()
            
        }
    }
    
    
}
















