//
//  chattingTableViewCell.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit
class chattingTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var messageFromLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.layer.frame.width/2
        profileImage.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        profileImage.layer.borderWidth = 0.1

        
        

        // Configure the view for the selected state
    }

}
