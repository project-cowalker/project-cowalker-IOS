//
//  RecruitService.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 4..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

struct RecruitService:APIService{
    static func recruitInit(position:String, start_date:String, end_date:String, number:Int, task:String, activity:String, reward:String, area:String, ability:String, career:String, preference:String, comment:String, question:[String], completion : @escaping (String)->Void) {
        
        //
        
        
        let URL = url("/recruit")
        //var headers = UserDefaults.standard.string(forKey: "token")
        
        let body: [String : Any] = [
            "position" : position,
            "start_date" : start_date,
            "end_date" : end_date,
            "number" : number,///////////
            "task": task,
            "activitiy" : activity,
            "reward" : reward,
            "area" : area,
            "ability" : ability,
            "career": career,
            "preference": preference,
            "comment" : comment,
            "question" : question/////////////
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
                    //print()
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

