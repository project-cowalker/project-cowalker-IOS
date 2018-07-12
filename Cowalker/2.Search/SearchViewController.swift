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
        cell.imgView.kf.setImage(with: URL(string: gsno(searchData[indexPath.row].img_url)), placeholder: UIImage())
        
        cell.labelText1.text = checkTheText(temp: searchData[indexPath.row].title)
        cell.labelText2.text = checkTheText(temp: searchData[indexPath.row].aim)
       

        return cell
    
    }
    var temp: String = String()
    override func prepare(for segue:UIStoryboardSegue, sender:Any?) {
        if segue.identifier == "Project",
            let dest = segue.destination as? ProjectIntroViewController
        {
            dest.tempProjectId = temp
            print(1111111111)
            print(temp)
        }
    }
    //tempProjectId
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        temp = searchData[indexPath.row].project_idx!
        print(searchData[indexPath.row].project_idx!)
        print(temp)
        let storyboard: UIStoryboard = UIStoryboard(name: "Project", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProjectIntroViewController") as! ProjectIntroViewController
        
        self.present(vc, animated: false, completion: nil)
        
        
    }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:180*self.view.frame.width/375   , height: 180*self.view.frame.height/667 )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
}
    ////////////////검색필터
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func filterBtnAct(_ sender: UIButton) {
        //필터뷰 오픈, 프리젠트
        let storyboard: UIStoryboard = self.storyboard!
        if let nextView = storyboard.instantiateViewController(withIdentifier: "FilterViewController") as? FilterViewController{
            self.navigationController?.pushViewController(nextView, animated: true)
        }
        
      
            
        
    }
    @IBOutlet weak var searchText: UITextField!
    static var filterURL = ""
    @IBAction func searchBtnAct(_ sender: UIButton) {
        
        //서치 뷰
        print("91919")
        
        if SearchViewController.filterURL == "" {
            if let tempText = searchText.text {
                print(tempText)
//                aim: nil, area: nil, position: nil, department: nil,
                SearchServie.searchInit2(aim: nil, area: nil, position: nil, department: nil, keyword: tempText, completion: { (Search) in
                    self.searchData = Search
                    print(Search.count)
                    self.projectCollectionView.reloadData()
                })
            }
           
        }else {
//            /search?aim=창업&area=서울&position=개발&department=iot&keyword=검색어
            if let tempText = searchText.text {
                
                SearchServie.searchInit2(aim: FilterViewController.aim, area: FilterViewController.area, position: FilterViewController.position, department: FilterViewController.department, keyword: tempText, completion: { (Search) in
                    self.searchData = Search
                    self.projectCollectionView.reloadData()
                })
            }
        }
    }
    func checkTheText(temp: String?) -> String{
        if temp == nil {
            return ""
        }else{
            return temp!
        }
    }
    var searchData: [Search] = [Search]()
    func initSearch(){
        SearchServie.searchInit(tempUrl: "") { (Search) in
            self.searchData = Search
            self.projectCollectionView.reloadData()
            
        }
    }
    
    
}
















