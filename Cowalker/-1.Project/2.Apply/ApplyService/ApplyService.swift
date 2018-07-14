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
    
    static func applyMemInit(add: String, completion: @escaping ([ApplyMember])->Void){
        let URL = url("/apply/\(add)")
//        let header: [String : String] = [
//            "authorization" : UserDefaults.standard.string(forKey: "token")!
//        ]
        let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozNCwiaWF0IjoxNTMwODkzOTEyLCJleHAiOjE1MzM0ODU5MTJ9.mgiKKWAUaCYiqn2hC77-T9VWYJdE2N8tpLNqw3MAVWA"]
         Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseData() {res in
            switch res.result{
                
            case .success:
                if let value = res.result.value{
                    let decoder = JSONDecoder()
                    do{print("tt1")
                        let applyMemData = try decoder.decode(ApplyMemberData.self, from: value)
                        print("tt2")
                        if  applyMemData.message == "success"{
                            print("tt3")
                            completion(applyMemData.result)
                        }
                    }catch{ }
                }
                break
            case .failure(let err):
                print(err.localizedDescription)
                break
            }
        }
    }
    
    static func applyWrite(introduce:String, portfolio_url:String, phone:String, recruit_idx:String, project_idx:String, position:String, answers:[String] ,completion : @escaping (String)->Void){
        
        let URL = url("/apply")
        
        let body: [String : Any] = [
            "introduce" : introduce,
            "portfolio_url" : portfolio_url,
            "phone" : phone,
            "recruit_idx" : recruit_idx,
            "project_idx" : project_idx,
            "position" : position,
            "answers" : answers
        ]
//        let header: [String : String] = [
//            "authorization" : UserDefaults.standard.string(forKey: "token")!
//        ]
        let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozNCwiaWF0IjoxNTMwODkzOTEyLCJleHAiOjE1MzM0ODU5MTJ9.mgiKKWAUaCYiqn2hC77-T9VWYJdE2N8tpLNqw3MAVWA"]
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseData() {res in
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
                break
            }
        }
    }
    
    
    static func applySelect(a: String, b: String, c: String, completion: @escaping (String)->Void){
        
        
        let URL = url("/apply/\(a)/\(b)/join/\(c)")
        
        let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozNCwiaWF0IjoxNTMwODkzOTEyLCJleHAiOjE1MzM0ODU5MTJ9.mgiKKWAUaCYiqn2hC77-T9VWYJdE2N8tpLNqw3MAVWA"]
        
        Alamofire.request(URL, method: .put, parameters: nil, encoding: JSONEncoding.default, headers: header).responseData() {res in
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
                break
            }
        }
    }
    
}




























