
//  MessageService.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 7..
//  Copyright © 2018년 조예원. All rights reserved.


import Foundation
import Alamofire
import SwiftyJSON
struct MessageService: APIService{
    
    //내 쪽지함 조회 get 요청 @@@@@@@@@@@@@@@@@@@@@@@@@@
    static func messageInit(completion: @escaping([Message]) -> Void){
        let URL = url("/message")
        

//        let header: [String : String] = [
//            "authorization" : UserDefaults.standard.string(forKey: "token")!
//        ]
        
        let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJpYXQiOjE1MzA2NzAxNTMsImV4cCI6MTUzMzI2MjE1M30.BdRb0yary7AY8_yi8MDRDXuXrW19QSqRJI-9Xin3SXs"]
        

        
        Alamofire.request(URL, method: .get, parameters: nil , encoding: JSONEncoding.default, headers: header).responseData() { res in
            switch res.result {
            case .success:
                if let value = res.result.value {
                    print(value)
                        let decoder = JSONDecoder()
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSS'Z"

                        decoder.dateDecodingStrategy = .formatted(dateFormatter)
                        print(1111111111)
                        do{

                            print("do 를 들어옴")
                            let messageData = try decoder.decode(MessageData.self, from: value)
                            print(222222222)
                            print(messageData)
                            if messageData.message == "get message success"{
                                print(messageData.message)
                                completion(messageData.result)
                                

                            }else{
                                print("access denied")
                                
                            }
                        }catch let err{
                            print(err)
                            print("catch")
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



