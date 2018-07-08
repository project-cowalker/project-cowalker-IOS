
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
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    //@@header 수정 해야함 지금은 테스트 단계
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
                    
                        let decoder = JSONDecoder()
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSS'Z"

                        decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    
                        do{

                            
                            let messageData = try decoder.decode(MessageData.self, from: value)
                           
                            if messageData.message == "get message success"{
                                
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
    
    // 상대방에게 쪽지 보내기 partner_idx 사용 쪽지함의 get 요청에서 partner_idx 를 받음
    // header 수정하기  지금은 Test 용 토큰
    static func sendingMessageToPartner(partner_idx: Int,contents: String, completion: @escaping () -> Void){
        let URL = url("/message/"+String(partner_idx))
        
        let body: [String: Any] = [
            "contents" : contents
        ]
        //        let header: [String : String] = [
        //            "Authorization" : UserDefaults.standard.string(forKey: "token")!
        //        ]
        
        let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJpYXQiOjE1MzA2NzAxNTMsImV4cCI6MTUzMzI2MjE1M30.BdRb0yary7AY8_yi8MDRDXuXrW19QSqRJI-9Xin3SXs"]
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseData() { res in
            switch res.result {
            case .success:
                if let value = res.result.value {
                    let message = JSON(value)["message"].string
                    if message == "send message success"{
                        completion()
                        
                    }
                }
                break
            case .failure(let err):
                print(err.localizedDescription)
                break
            }
        }
    }
    
    //클릭해서 상대 1명과의 쪽지 가져오기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    // header 수정하기 지금은 Test 용 토큰@@@@@@@@@@@@@@@@@@@@@ partner_idx로
    
    static func individualMessageInit(partner_idx: Int, completion: @escaping([IndividualMessage]) -> Void){
        let URL = url("/message/"+String(partner_idx))
        
//        let header: [String : String] = ["authorization" : UserDefaults.standard.string(forKey: "token")!
        let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJpYXQiOjE1MzA2NzAxNTMsImV4cCI6MTUzMzI2MjE1M30.BdRb0yary7AY8_yi8MDRDXuXrW19QSqRJI-9Xin3SXs"]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseData() { res in
            switch res.result {
            case .success:
                if let value = res.result.value {
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSS'Z"
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    do {
                        
                        let individualMessageData = try decoder.decode(IndividualMessageData.self, from: value)
                        
                        if individualMessageData.message == "get message success"{
                           
                            completion(individualMessageData.result)
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

