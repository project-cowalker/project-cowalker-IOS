//
//  ParticipatedProject.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 9..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation
//"img_url": [
//"https://project-cowalker.s3.ap-northeast-2.amazonaws.com/1530871591745.jpg"
//],
//"_id": "5b3f3f28a989031a3ef84e3c",
//"title": "dd",
//"summary": "dd",
//"area": "강원도",
//"department": "컨텐츠",
//"aim": "사이드 프로젝트",
//"explain": "ss",
//"user_idx": 3,
//"create_at": "2018-07-06T10:06:32.218Z"
struct ParticipatedProject: Codable {
    let img_url: [String]?
    let _id: String?
    let title: String?
    let summary: String?
    let area: String?
    let department: String?
    let aim: String?
    let explain: String?
    let user_idx: Int
    let create_at: Date

    
}
