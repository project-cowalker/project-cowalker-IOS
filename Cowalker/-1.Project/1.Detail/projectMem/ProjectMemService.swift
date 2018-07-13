//
//  ProjectMemService.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 12..
//  Copyright © 2018년 조예원. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON
import UIKit

struct ProjectMemService:APIService{
    
    static func projectMemInit(add:String, completion: @escaping ([ProjectMem])->Void){
        
        let URL = url("/project/team/\(add)")
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData() {res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    let decoder = JSONDecoder()
                    do{
                        let projectMemData = try decoder.decode(ProjectMemData.self, from: value)
                        if  projectMemData.message == "success"{
                             completion(projectMemData.member)
                        }
                    }catch{ }
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
