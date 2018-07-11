//
//  NewAlarmData.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 10..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation

struct NewAlarmData: Codable {
    let message: String
    let result: [NewAlarm]
}
