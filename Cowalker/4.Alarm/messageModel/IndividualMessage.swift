//
//  IndividualMessage.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 7..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation

struct IndividualMessage: Codable {
    let to_user_name: String?
    let from_user_name: String?
    let contents: String?
    let create_at: Date
    let time: String?
}

//"to_user_name": "김가영",
//"from_user_name": "나",
//"contents": "저기요",
//"create_at": "2018-07-06T01:26:07.586Z"

