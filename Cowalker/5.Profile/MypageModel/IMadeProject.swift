//
//  IMadeProject.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 9..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation
struct IMadeProject: Codable {
    let title: String?
    let summary: String?
    let area: String?
    let department: String?
    let aim: String?
    let explain: String?
    let create_at: Date
    let img_url: [String]?
}
//"title": "다시다시",
//"summary": "1234testㅇㅇ",
//"area": "서울",
//"department": "안녕",
//"aim": "히히",
//"explain": "test",
//"create_at": "2018-07-07T08:33:12.604Z",
//"img_url": [
//"https://project-cowalker.s3.ap-northeast-2.amazonaws.com/1530952392068.png"
//]

