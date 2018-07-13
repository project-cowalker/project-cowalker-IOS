//
//  RecruitNaviViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 13..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class RecruitNaviViewController: UINavigationController {

    var tempPI = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let secondVC = UIStoryboard(name: "Recruit", bundle:nil ).instantiateViewController(withIdentifier: "RecruitOneViewController") as! RecruitOneViewController
        
        
        secondVC.tempPI = self.tempPI
    }

}
