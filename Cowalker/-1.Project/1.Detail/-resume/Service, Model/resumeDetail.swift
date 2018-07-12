//
//  resumeDetail.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 9..
//  Copyright © 2018년 조예원. All rights reserved.
//


import Foundation

struct resumeDetail: Codable {
    
    let apply_idx: String
    let introduce: String
    let portfolio_url: String
    let phone: String
    let recruit_idx: String
    let applicant_idx: String
    let recruit_at: String
    let answers: [String]
}

