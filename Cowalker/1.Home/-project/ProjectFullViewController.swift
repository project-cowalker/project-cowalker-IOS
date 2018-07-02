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
        
        // 오른쪽 버튼 추가
        // 왼쪽 버튼 색 변경
    }
    
    
    
    
    
    
    @IBAction func JoinBtnAct(_ sender: UIButton) {
        let secondVC = UIStoryboard(name: "Home", bundle:nil ).instantiateViewController(withIdentifier: "ProjectJoinViewController") as! ProjectJoinViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
}
