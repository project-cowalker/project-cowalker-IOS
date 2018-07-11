//
//  SearchService.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 11..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation
import Alamofire

struct SearchServie: APIService {
    static func searchInit(completion: @escaping ([Search]) -> Void){
        let URL = url("/search")
        Alamofire.request(URL, method: .get, parameters: nil , encoding: JSONEncoding.default, headers:nil).responseData() { res in
            switch res.result {
            case .success:
                if let value = res.result.value {
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSS'Z"
                    
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    
                    
                    do {
                        let searchData = try decoder.decode(SearchData.self, from: value)
                        if searchData.message == "success"{
                            print(11111)
                            completion(searchData.result)
                        }
                    }catch let err {
                      
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
//static func myPageInit(tempUrl: String, completion: @escaping([MyPage]) -> Void){
//    //        let header: [String : String] = [
//    //            "authorization" : UserDefaults.standard.string(forKey: "token")!
//
//    let URL = url("/mypage"+tempUrl)
//    let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJpYXQiOjE1MzA2NzAxNTMsImV4cCI6MTUzMzI2MjE1M30.BdRb0yary7AY8_yi8MDRDXuXrW19QSqRJI-9Xin3SXs"]
//
//    Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseData() { res in
//        switch res.result{
//        case .success:
//            if let value = res.result.value {
//                let decoder = JSONDecoder()
//                do {
//                    print(11111)
//                    let myPageData = try decoder.decode(MyPageData.self, from: value)
//                    if myPageData.message == "success"{
//                        print("가져옴")
//                        completion(myPageData.data)
//
//                    }
//
//                }catch let err{
//                    print(err)
//
//                }
//
//            }
//            break
//
//        case .failure(let err):
//            print(err.localizedDescription)
//            break
//
//        }
//    }
//
//}

