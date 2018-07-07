//
//  AlarmSecondViewController.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 4..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class AlarmSecondViewController: UIViewController {
    var partner_idx = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.3364960849, green: 0.3365047574, blue: 0.3365000486, alpha: 1)
        self.navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.3364960849, green: 0.3365047574, blue: 0.3365000486, alpha: 1)
//        MessageService.individualMessageInit(partner_idx: partner_idx, completion: <#T##([IndividualMessage]) -> Void#>)
      
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
        self.navigationController?.popViewController(animated: true)
    }
    
    

    
    
    
    
    
}
