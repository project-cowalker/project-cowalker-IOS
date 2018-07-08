//
//  MypageService.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 8..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
struct MypageService: APIService {

    static func myPageInit(completion: @escaping([MyPage]) -> Void){
//        let header: [String : String] = [
//            "authorization" : UserDefaults.standard.string(forKey: "token")!
        
        let URL = url("/mypage")
        let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJpYXQiOjE1MzA2NzAxNTMsImV4cCI6MTUzMzI2MjE1M30.BdRb0yary7AY8_yi8MDRDXuXrW19QSqRJI-9Xin3SXs"]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseData() { res in
            switch res.result{
            case .success:
                if let value = res.result.value {
                    let decoder = JSONDecoder()
                    do {
                        let myPageData = try decoder.decode(MyPageData.self, from: value)
                        if myPageData.message == "success"{
                            completion(myPageData.result)
                        }
                        
                    }catch let err{
                        print(err)
                        
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