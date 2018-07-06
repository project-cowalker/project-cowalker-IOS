//
//  AlarmSecondViewController.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 4..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class AlarmSecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func sendingMessagePage(_ sender: Any) {
        
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "AlarmThirdNaviController")
        
        present(nextView, animated: true, completion: nil)
        
        
    }
    
    
    
    @IBAction func goToBackPage(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func deleteMessage(_ sender: Any) {
        deleteAlert()
        // message 전체 삭제로 알람 띄우고 삭제
       
    }
    func deleteAlert(){
        let message = UIAlertController(title: "쪽지 전체 삭제하기", message: "쪽지를 전체 삭제하시겠습니까?", preferredStyle: .alert)
        let cancel = UIAlertAction(title:"취소", style: UIAlertActionStyle.default)
        let action = UIAlertAction(title: "삭제", style: UIAlertActionStyle.default)
        message.addAction(cancel)
        message.addAction(action)
        self.present(message, animated: true,completion: nil)
    }
    
    
    
    
    
}
