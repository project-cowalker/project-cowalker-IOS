//
//  IndividualMessageData.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 7..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation

struct IndividualMessageData: Codable {
    let message: String
    let result: [IndividualMessage]
}
