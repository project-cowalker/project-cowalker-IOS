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
        let header: [String : String] = [
            "authorization" : UserDefaults.standard.string(forKey: "token")!
        ]
        
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
