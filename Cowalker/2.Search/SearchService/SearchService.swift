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
//    static func searchInit(tempUrl: String, completion: @escaping ([Search]) -> Void){
//        let URL = url("/search"+tempUrl)
//        print(URL)
//        Alamofire.request(URL, method: .get, parameters: nil , encoding: JSONEncoding.default, headers:nil).responseData() { res in
//            switch res.result {
//            case .success:
//                if let value = res.result.value {
//                    let decoder = JSONDecoder()
//                    let dateFormatter = DateFormatter()
//                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSS'Z"
//
//                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
//                    print("URL@@@@@")
//                    print(URL)
//
//                    do {
//                        let searchData = try decoder.decode(SearchData.self, from: value)
//                        if searchData.message == "success"{
//                            print("success")
//                            completion(searchData.result)
//                        }
//                    }catch let err {
//
//                        print(err)
//                    }
//
//                }
//                break
//            case .failure(let err):
//                print(222222222)
//                print(err.localizedDescription)
//                break
//
//
//            }
//        }
//    }
    
    
    static func searchInit(tempUrl: String, completion: @escaping ([Search]) -> Void){
        let URL = url("/search"+tempUrl)
        print(URL)
        Alamofire.request(URL, method: .get, parameters: nil , encoding: JSONEncoding.default, headers:nil).responseData() { res in
            switch res.result {
            case .success:
                if let value = res.result.value {
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSS'Z"
                    
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    print("URL@@@@@")
                    print(URL)
                    
                    do {
                        let searchData = try decoder.decode(SearchData.self, from: value)
                        if searchData.message == "success"{
                            print("success")
                            completion(searchData.result)
                        }
                    }catch let err {
                        
                        print(err)
                    }
                    
                }
                break
            case .failure(let err):
                print(222222222)
                print(err.localizedDescription)
                break
                
                
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
}






