//
//  ProjectPartDetailViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class ProjectPartDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // 화면 전환
    @IBAction func btnClickAct(_ sender: UIButton) {
        let secondVC = UIStoryboard(name: "Home", bundle:nil ).instantiateViewController(withIdentifier: "ProjectMemberViewController") as! ProjectMemberViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    @IBAction func JoinBtnAct(_ sender: UIButton) {
        let secondVC = UIStoryboard(name: "Home", bundle:nil ).instantiateViewController(withIdentifier: "ProjectJoinViewController") as! ProjectJoinViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
}
