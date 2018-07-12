//
//  applyMemTableViewCell.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 7..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class applyMemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var memImg: UIImageView!
    @IBOutlet weak var memName: UILabel!
    @IBOutlet weak var memPart: UILabel!
    @IBOutlet weak var resumeBtn: UIButton!
    
    @IBAction func resumeBtnAct(_ sender: UIButton) {
        // 이력서 화면으로 이동
        
    }
    
    @IBAction func replyBtnAct(_ sender: UIButton) {
        if sender.tag == 0{ // 거절일때
            
        }else{ // 수락일 때
            
        }
    }
}


