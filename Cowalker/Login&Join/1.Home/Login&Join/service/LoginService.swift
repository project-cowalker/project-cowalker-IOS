//
//  LoginService.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//
import Foundation
import Alamofire
import SwiftyJSON
import UIKit

struct LoginService:APIService{
    static func logInit(email:String, password:String, completion : @escaping (Array<String>)->Void) {
        let URL = url("/signin")
        
        let body: [String : Any] = [
            "email":email,
            "password":password
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseData() {res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                   
                    var arr = ["",""]
                    if let message = JSON(value)["message"].string {
                        arr[0] = message
                    }
                    if let token = JSON(value)["token"].string{
                        arr[1] = token
                    }
                    completion(arr)
                }
                break
            case .failure(let err):
                print(err.localizedDescription)
                
                
                break
            }
        }
    }
}
