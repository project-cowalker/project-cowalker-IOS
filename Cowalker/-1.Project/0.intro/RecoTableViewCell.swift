//
//  RecoTableViewCell.swift
//  
//
//  Created by 조예원 on 2018. 7. 12..
//

import UIKit

class RecoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var btnCheck: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
