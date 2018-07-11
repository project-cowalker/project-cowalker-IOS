//
//  SearchData.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 11..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation

struct SearchData: Codable {
    let message: String
    let result: [Search]
}
