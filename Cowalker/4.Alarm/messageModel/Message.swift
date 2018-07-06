//
//  Message.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 7..
//  Copyright © 2018년 조예원. All rights reserved.
//
//
import Foundation
struct Message: Codable {
    let partner_idx: Int
    let partner_name: String?
    let partner_profile_url: String?
    let contents: String?
    let create_at: String?
    

    
}

