//
//  CreateNewProjectService.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 4..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit
    


struct CreateNewProjectService: APIService {
   
    // 프로젝트 생성하는 3번째 탭바 API@@@@@@@@@@@@@@@@@
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    static func createNewProject(title: String, summary: String, area: String, department: String, aim: String ,explain: String, img_url: UIImage, completion: @escaping (String) -> Void){
        let URL = url("/project")
//        let userdefault = UserDefaults.standard
        let titleData = title.data(using: .utf8)
        let summaryData = summary.data(using: .utf8)
        let areaData = area.data(using: .utf8)
        let departmentData = department.data(using: .utf8)
        let aimData = aim.data(using: .utf8)
        let explainData = explain.data(using: .utf8)
        let img_urlData = UIImageJPEGRepresentation(img_url, 0.3)
        //token 처리도 해야함 유저로 가게
        
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJpYXQiOjE1MzA2NzAxNTMsImV4cCI6MTUzMzI2MjE1M30.BdRb0yary7AY8_yi8MDRDXuXrW19QSqRJI-9Xin3SXs"
        let header = ["authorization" : token]
        Alamofire.upload(multipartFormData: { (multipartFormData) in

            multipartFormData.append(titleData!, withName: "title")
            multipartFormData.append(summaryData!, withName: "summary")
            multipartFormData.append(areaData!, withName: "area")
            multipartFormData.append(departmentData!, withName: "department")
            multipartFormData.append(aimData!, withName: "aim")
            multipartFormData.append(explainData!, withName: "explain")
            multipartFormData.append(img_urlData!, withName: "img", fileName: "img.jpg" , mimeType: "image/jpeg")
            
        }, to: URL, method: .post, headers: header)
        { (encodingResult) in
            print("ㅅㅂ")
            switch encodingResult {
                
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
                upload.responseData(completionHandler: { (res) in
                    print("야호")
                    switch res.result{
                    case .success:
                        print("야호")
                        
                        if let value = res.result.value {
                            print(value)
                            print(1)
                            //   let json = response.result.value as? [String: Any]
                            let message = JSON(value)["message"].string
                            
                            print(2)
                            
                            if message == "success"{
                                print(3)
                                completion(message!)
                            }else if message == "fail"{
                                print("fail")
                            }else if message == "access denied"{
                                print("just nothing")
                            }else {
                                print("shit")
                            }
                            
                        }
                        break
                    case .failure(let err):
                        print("개시발")
                        print(err.localizedDescription)
                    }
                    
                })
                
            case .failure(let err):
                print("젖같네")
                print(err.localizedDescription)
                
            }
        }
        
    }
    static func getProjectDeatil(){
        
    }
//    let URL = url("/message")
//
//
//    //        let header: [String : String] = [
//    //            "authorization" : UserDefaults.standard.string(forKey: "token")!
//    //        ]
//
//    let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJpYXQiOjE1MzA2NzAxNTMsImV4cCI6MTUzMzI2MjE1M30.BdRb0yary7AY8_yi8MDRDXuXrW19QSqRJI-9Xin3SXs"]
//
//
//
//    Alamofire.request(URL, method: .get, parameters: nil , encoding: JSONEncoding.default, headers: header).responseData() { res in
//    switch res.result {
//    case .success:
//    if let value = res.result.value {
//    print(value)
//    let decoder = JSONDecoder()
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSS'Z"
//
//    decoder.dateDecodingStrategy = .formatted(dateFormatter)
//    print(1111111111)
//    do{
//
//    print("do 를 들어옴")
//    let messageData = try decoder.decode(MessageData.self, from: value)
//    print(222222222)
//    print(messageData)
//    if messageData.message == "get message success"{
//    print(messageData.message)
//    completion(messageData.result)
//
//
//    }else{
//    print("access denied")
//
//    }
//    }catch let err{
//    print(err)
//    print("catch")
//    }
//    }
//
//
//
//    break
//    case .failure(let err):
//    print(err.localizedDescription)
//    break
//    }
//    }
    
}


