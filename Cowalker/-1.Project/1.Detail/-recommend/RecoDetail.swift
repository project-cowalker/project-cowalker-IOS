//
//  RecoDetail.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 12..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation

struct RecoDetail: Codable{
    let recommend_idx: Int
    let recommender_idx: Int
    let reason: String
    let project_idx: String
    let recruit_idx: String
}

