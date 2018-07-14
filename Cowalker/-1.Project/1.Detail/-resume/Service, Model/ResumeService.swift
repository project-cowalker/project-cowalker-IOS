//
//  ResumeService.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 12..
//  Copyright © 2018년 조예원. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON
import UIKit

struct ResumeService:APIService{
    
    static func resumeInit(a:String, b:String, completion: @escaping ([resumeDetail])->Void){
        
        let URL = url("/apply/\(a)/\(b)")
        
//        let header: [String : String] = [
//            "authorization" : UserDefaults.standard.string(forKey: "token")!
//        ]
        let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozNCwiaWF0IjoxNTMwODkzOTEyLCJleHAiOjE1MzM0ODU5MTJ9.mgiKKWAUaCYiqn2hC77-T9VWYJdE2N8tpLNqw3MAVWA"]
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseData() {res in
            switch res.result{
                
            case .success:
                if let value = res.result.value{
                    let decoder = JSONDecoder()
                    do{
                        let resumData = try decoder.decode(resumeDetailData.self, from: value)
                        if  resumData.message == "success"{
                            completion(resumData.result)
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
}


