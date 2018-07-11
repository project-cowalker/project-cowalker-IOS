//
//  HomeDetail.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 11..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation

struct HomeDetail: Codable {
    
    let img_url: [String]?
    let _id: String?
    let title: String?
    let summary: String?
    let area: String?
    let department: String?
    let aim: String?
    let explain: String?
    let user_idx: Int?
    let create_at: Date?
}