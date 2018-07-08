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
    
    static func applyWrite(introduce:String, portfolio_url:String, phone:String, recruit_idx:String, project_idx:String, position:String, answers:[String] ,completion : @escaping (String)->Void){
        
        let URL = url("/apply")
        
        let body: [String : Any] = [
            "introduce" : introduce,
            "portfolio_url" : portfolio_url,
            "phone" : phone,
            "recruit_idx" : "11",
            "project_idx" : "5b3f3f28a989031a3ef84e3c",
            "position" : position,
            "answers" : answers
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

    // applyinit
    
    /*
    //
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
}*/
    
    
}




























