//
//  ProjectFullViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class ProjectFullViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "여정"
        // 네비게이션 추가
        
        // 탭바는 없음
    
    }
    
    
    
    
    
    
    @IBAction func JoinBtnAct(_ sender: UIButton) {
        let secondVC = UIStoryboard(name: "Home", bundle:nil ).instantiateViewController(withIdentifier: "ProjectJoinViewController") as! ProjectJoinViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
}
