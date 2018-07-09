//
//  ParticipatedProject.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 9..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation

struct ParticipatedProject: Codable {
    let img_url: [String]?
    let _id: String?
    let title: String?
    let summary: String?
    let area: String?
    let department: String?
    let aim: String?
    let explain: String?
    let user_idx: Int
    let create_at: Date

    
}
