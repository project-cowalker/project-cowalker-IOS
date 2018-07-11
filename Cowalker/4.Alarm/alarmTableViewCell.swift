//
//  alarmTableViewCell.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class alarmTableViewCell: UITableViewCell {
    @IBOutlet weak var project_name: UILabel!
    @IBOutlet weak var contents: UILabel!
    
    @IBOutlet weak var create_at: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
