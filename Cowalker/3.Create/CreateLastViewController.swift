//
//  CreateLastViewController.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class CreateLastViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
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
        imagePicker.delegate = self
        
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
 
    
    
}
