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
    let create_at: Date
    
//
//    "partner_idx": 4,
//    "partner_name": "성누리",
//    "partner_profile_url": "이미지 주소",
//    "contents": "잘부탁드립니다",
//    "create_at": "2018-07-06T02:30:07.623Z"
//},
//{
//    "partner_idx": 3,
//    "partner_name": "김가영",
//    "partner_profile_url": "이미지 주소",
//    "contents": "잘부탁드립니다",
//    "create_at": "2018-07-06T01:29:02.718Z"
}

