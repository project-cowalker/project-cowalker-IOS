//
//  MyPageUpdateViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class MyPageUpdateViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageForProject.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroductionEditCollectionViewCell", for: indexPath) as! IntroductionEditCollectionViewCell
        cell.editingImage.image = imageForProject[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var viewForIntro: UICollectionView!
    
    @IBOutlet weak var introductionTextView: UITextView!
    
    
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
    
    
    var imageForProject =  [#imageLiteral(resourceName: "btnAddPic")]
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
            viewForIntro.reloadData()
        }
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    @IBAction func finishedEditingIntroduction(_ sender: UIButton) {
        editInit()
    }
    
    
   
    func editInit(){
        if imageForProject.count != 10 {
            imageForProject.remove(at: imageForProject.count-1)
        }
        MypageService.myPageIntroEdit(img: imageForProject, contents: introductionTextView.text) { (message) in
            if message == "update myIntro success"{
                self.navigationController?.popViewController(animated: true)
            }else{
                print("wjekrjkwejl")
            }
        }
    }
    func funcForNavigationBar(){
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "내 소개 수정"
        let leftButtonItem = UIBarButtonItem(image: UIImage(named: "iconCaretLeftDarkgray"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(MyPageUpdateViewController.popAction))
       
        leftButtonItem.tintColor = UIColor.black
        
        self.navigationItem.leftBarButtonItem = leftButtonItem
     
    }
    @objc func popAction(){
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        viewForIntro.delegate = self
        viewForIntro.dataSource = self
        imagePicker.delegate = self
        funcForNavigationBar()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
