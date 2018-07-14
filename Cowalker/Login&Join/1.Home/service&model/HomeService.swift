//
//  HomeService.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 11..
//  Copyright © 2018년 조예원. All rights reserved.
//
import Foundation
import Alamofire
import SwiftyJSON
import UIKit

struct HomeService: APIService {
    
    static func getHomeDeatil(completion: @escaping ([HomeDetail]) -> Void){
        let URL = url("/home")
//        let header: [String : String] = [
//            "authorization" : UserDefaults.standard.string(forKey: "token")!
//        ]
        let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozNCwiaWF0IjoxNTMwODkzOTEyLCJleHAiOjE1MzM0ODU5MTJ9.mgiKKWAUaCYiqn2hC77-T9VWYJdE2N8tpLNqw3MAVWA"]
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseData() { res in
            switch res.result {
            case .success:
                if let value = res.result.value {
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSS'Z"
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    do {                        let homeDetailData = try decoder.decode(HomeDetailData.self, from: value)
                        if homeDetailData.message == "success"{
                            completion(homeDetailData.result)
                        }
                    }catch let err{
                        print(err)
                    }
                }
                break
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
