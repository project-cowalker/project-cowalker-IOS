//
//  RecruitService.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 7..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

struct RecruitService:APIService{
    
    //////////////////////// 모집하기 리스트 조회
    // RecuritListData
    static func recruitList(add:String, completion: @escaping ([RecruitList])->Void){
        
        let URL = url("/project/\(add)/recruit")
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData() {res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    let decoder = JSONDecoder()
                    do{
                        let recruitListData = try decoder.decode(RecruitListData.self, from: value)
                        print(recruitListData.message)//
                        if recruitListData.message == "success"{
                            completion(recruitListData.result)
                        }else if recruitListData.message == "database failure"{
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
    
    //////////////////////////// 모집 상세 RecruitDetail
    static func recruitDetail(a:String, b:String, completion: @escaping ([RecruitDetail],String)->Void){
        let URL = url("/project/\(a)/recruit/\(b)")
        
        let header: [String : String] = [
            "authorization" : UserDefaults.standard.string(forKey: "token")!
        ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseData() {res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    let decoder = JSONDecoder()
                    do{
                        let recruitDetailData = try decoder.decode(RecruitDetailData.self, from: value)
                        if recruitDetailData.message == "success"{
                            completion(recruitDetailData.result!, recruitDetailData.btnResult!)
                        }
                    }catch{ print("캐치22")}//////
                }
                break
            case .failure(let err):
                print(err.localizedDescription)
                print("err")
                break
            }
        }
    }
    
    static func recruitInit(project_idx:String, position:String, start_date:String, end_date:String, number:Int, task:String, activity:String, reward:String, area:String, ability:String, career:String, preference:String, comment:String, question:[String], completion : @escaping (String)->Void){
        
        let URL = url("/project/recruit")
        let header: [String : String] = [
            "authorization" : UserDefaults.standard.string(forKey: "token")!
        ]
        let body: [String : Any] = [
            "project_idx" : "5b4723d2a92c52665a28b99b", //project_idx,
            "position" : "PM",// position,
            "start_date" : "2018-07-03" ,//start_date,
            "end_date" : "2018-07-03", // end_date,
            "number" : 1, //number,///////////
            "task": "3", //task,
            "activitiy" : "3", //activity,
            "reward" : "3", //reward,
            "area" : "3", //area,
            "ability" : "3", //ability,
            "career": "3", //career,
            "preference": "3", //preference,
            "comment" : "3", //comment,
            "question_list" : ["3", "3"] //question///
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseData() {res in
            
            print("구일아 만나줘~~10")
            switch res.result{
            case .success:
                if let value = res.result.value{
                    print("구일아 만나줘~~0")
                    if let message = JSON(value)["message"].string {
                        completion(message)
                        print("구일아 만나줘~~1")
                    }
                    print("구일아 만나줘~~2")
                }
                break
            case .failure(let err):
                print(err.localizedDescription)
                print("구일아 만나줘~~3")
                break
            }
        }
    }
    }
