//
//  messageTableViewCell.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 4..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class messageTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    
    
    
}
