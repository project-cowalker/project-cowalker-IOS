//
//  resumeDetailData.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 9..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation


struct resumeDetailData: Codable{
    let message: String
    let result: [RecruitDetail]
}
