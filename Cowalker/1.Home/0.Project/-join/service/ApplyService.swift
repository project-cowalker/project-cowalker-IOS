//
//  ApplyService.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 5..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

struct ApplyService:APIService{
    
    
    static func applyInit(introduce:String, portfolio_url:String, phone:String, recruit_idx:String, project_idx:String, position:String, answers:[String] ,completion : @escaping (String)->Void) {
         let URL = url("/apply")
       
        
        let body: [String : Any] = [
            "introduce" : "안녕하세요.저는 문지현입니다.",
            "portfolio_url" : "https://project-cowalker.s3.ap-northeast-2.amazonaws.com/1530643487481.txt",
            "phone" : "010-1234-5678",
            "recruit_idx" : "11",
            "project_idx" : "5b3f3f28a989031a3ef84e3c",
            "position" : "PM",
            "answers" : ["잘 할 수 있습니다.", "뽑아주세요."]
        ]
        
        let header: [String : String] = [
            "authorization" : UserDefaults.standard.string(forKey: "token")!
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseData() {res in
            //print(0)
            switch res.result{
                
            case .success:
                if let value = res.result.value{
                    print(1)
                    if let message = JSON(value)["message"].string {
                        //   print("33333")
                        completion(message)
                    }
                }
                break
            case .failure(let err):
                print("fail")
                print(err.localizedDescription)
                break
            }
        }
    }
    
    static func applyList(a:String, b:String, c:String, completion: @escaping (String)->Void){ // 지원자 테이블 출력
        let URL = url("/\(a)/\(b)/join/\(c)")
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData() {res in
            
            switch res.result{
            case .success:
                
                if let value = res.result.value{
                    if let message = JSON(value)["message"].string {
                        completion(message)
                        
                    }
                }
                break
            case .failure(let err):
                print(err.localizedDescription)
                print("err")
                break
            }
    }
}
}




























