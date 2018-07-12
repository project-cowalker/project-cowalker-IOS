//
//  Recruit.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 13..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation

struct Recruit: Codable {
    let project_idx: String?
    let position: String?
    let start_date: String?
    let end_date: String?
    let number: Int?
    
    let task: String?
    let activity: String?
    let reward: String?
    let area: String?
    let ability: String?
    let career: String?
    let preference: String?
    let comment: String?
    let question_list: [String]?
}

