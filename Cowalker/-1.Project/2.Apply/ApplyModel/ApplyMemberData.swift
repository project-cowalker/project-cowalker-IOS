//
//  ApplyMemberData.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 12..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation

struct ApplyMemberData: Codable{
    let message: String
    let result: [ApplyMember]
}