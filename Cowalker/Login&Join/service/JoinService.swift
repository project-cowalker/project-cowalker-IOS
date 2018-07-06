//
//  JoinService.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

struct JoinService:APIService{
    static func joinInit(email:String, password:String, name:String, completion : @escaping (String)->Void) {
        let URL = url("/signup")
        let body: [String : Any] = [
            "email":email,
            "password":password,
            "name":name
        ]
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseData() {res in
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
    
    
    static func overrideCheck (add:String, completion: @escaping (String)->Void){
        
        let URL = url("/signup/check?email=\(add)")
       
        
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














