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
    
    
    static func applyInit(introduce:String, portfolio_url:String, recruit_idx:String, question:String, completion : @escaping (String)->Void) {
        
        let URL = url("/apply")
        
        let body: [String : Any] = [
            "introduce" : "안녕하세요.저는 문지현입니다.",
            "portfolio_url" : "https://project-cowalker.s3.ap-northeast-2.amazonaws.com/1530643487481.txt",
            "recruit_idx" : "11",
            "answers" : "3"
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
}

