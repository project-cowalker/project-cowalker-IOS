//
//  CreateLastViewController.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class CreateLastViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate {
    var imageForProject =  [#imageLiteral(resourceName: "btnAddPic")]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageForProject.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateImageCollectionViewCell", for: indexPath) as! CreateImageCollectionViewCell
        cell.projectImage.image = imageForProject[indexPath.row]
        
        return cell
    }
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }

    
    @IBOutlet weak var finishButton: UIButton!
    
    @IBOutlet weak var viewForProject: UICollectionView!
    
    @IBOutlet weak var explainTextView: UITextView!
    
    override func viewDidLoad() {
       
        viewForProject.dataSource = self
        viewForProject.delegate = self
        imagePicker.delegate = self
        explainTextView.placeholder = "팀 소개, 주요 업무, 자격 요건, 팀 빌딩 절차, 문의처, 상세정보"
        
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    let imagePicker = UIImagePickerController()
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        imagePicker.allowsEditing =  false
        imagePicker.sourceType = .photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
        if numOfPic >= 10 {
            imagePicker.dismiss(animated: true, completion: nil)
            maxPicFunc()
        }
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {

        self.dismiss(animated: true)
    }
    var numOfPic = 0
    
  
    
    func maxPicFunc(){
        let message = UIAlertController(title: "10장 초과!", message: "사진은 10장 까지 등록 가능합니다.", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
        message.addAction(action)
        self.present(message, animated: true,completion: nil)
    }
   
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if numOfPic == 10 {
            self.dismiss(animated: true, completion: nil)
        }
        
        if let selectedImage: UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
          
            if numOfPic == 0 {
                imageForProject.remove(at: 0)
            }else if imageForProject[numOfPic] ==  #imageLiteral(resourceName: "btnAddPic"){
                imageForProject.remove(at: numOfPic)
                
            }
            
            imageForProject.append(selectedImage)
            
            numOfPic += 1
            
            if numOfPic < 10{
                imageForProject.append(#imageLiteral(resourceName: "btnAddPic"))
            }
            viewForProject.reloadData()
        }
        
        
        self.dismiss(animated: true, completion: nil)
     }
    
    var title2: String!
    var summary: String!
    var area: String!
    var department: String!
    var aim: String!
    var explain: String!
    var img_url: [UIImage] = [UIImage]()
    
 
    @IBAction func createProjectDone(_ sender: UIButton) {
        img_url = imageForProject
        explain = explainTextView.text!
        if img_url.count < 10 {
            img_url.remove(at: img_url.count-1)
        }
        CreateNewProjectService.createNewProject(title: title2, summary: summary, area: area, department: department, aim: aim ,explain: explain, img: img_url) {
           (message) in
           print(message)
            if message == "success"{
                print("111111111111111111111")
                let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "MyTabViewController") as! MyTabViewController
                self.present(vc, animated: false, completion: nil)//////
                
            }else {
                print("222222222")
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        
    }

    
}
