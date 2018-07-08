//
//  ProjectDetail.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 7..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation

struct ProjectDetail: Codable {
    
    let title: String?
    let summary: String?
    let area: String?
    let department: String?
    let aim: String?
    let explain: String?
    let create_at: Date
    let img_url: [String]?
   
}
