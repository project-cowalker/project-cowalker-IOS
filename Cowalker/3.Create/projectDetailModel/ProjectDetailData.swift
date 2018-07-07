//
//  ProjectDetailData.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 7..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation
struct ProjectDetailData: Codable {
    let message: String?
    let result: [ProjectDetail]
    let user: String?
    
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//    * user  -> 총 4가지의 value값을 가진다.
//
//    - user : "개발자 "
//    - user : "참여하기"
//    - user : "참여대기"
//    - user : "참여완료"

}
