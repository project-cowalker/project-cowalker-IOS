//
//  APIService.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation


import Foundation


protocol APIService {
    
}

extension APIService {
    static func url(_ path : String) -> String {
        return "http://bghgu.tk:3000/api" + path
    }
}
