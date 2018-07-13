//
//  OtherMyPageData.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 14..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation
struct OtherMyPageData: Codable {
    let message: String
    let data: [OtherMyPage]
    let user_status: String
}
