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
                        print(11111)
                        let myPageData = try decoder.decode(MyPageData.self, from: value)
                        if myPageData.message == "success"{
                            completion(myPageData.data)
                            print("success")
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
    
    
    static func myPageEdit(profile_img: UIImage, background_img: UIImage, email: String, name: String, point: Int, position: String, introduce: String, portfolio_url: String, aim: String, department: String, area: String, completion: @escaping (String) -> Void){
        let URL = url("/mypage")
        let profile_imgData = UIImageJPEGRepresentation(profile_img, 0.3)
        let background_imgData = UIImageJPEGRepresentation(background_img, 0.3)
        let emailData = email.data(using: .utf8)
        let nameData = name.data(using: .utf8)
        let positionData = position.data(using: .utf8)
        let introduceData = introduce.data(using: .utf8)
        let portfolio_urlData = portfolio_url.data(using: .utf8)
        let aimData = aim.data(using: .utf8)
        let departmentData = department.data(using: .utf8)
        let areaData = area.data(using: .utf8)
        let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJpYXQiOjE1MzA2NzAxNTMsImV4cCI6MTUzMzI2MjE1M30.BdRb0yary7AY8_yi8MDRDXuXrW19QSqRJI-9Xin3SXs"]
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(profile_imgData!, withName: "profile_img", fileName: "profile_img.jpg", mimeType: "image/jpeg")
            multipartFormData.append(background_imgData!, withName: "background_img", fileName: "background_img.jpg", mimeType: "image/jpeg")
            multipartFormData.append(emailData!, withName: "email")
            multipartFormData.append(nameData!, withName: "name")
//            multipartFormData.append(pointData, withName: "point")
            multipartFormData.append(positionData!, withName: "position")
            multipartFormData.append(introduceData!, withName: "introduce")
            multipartFormData.append(portfolio_urlData!, withName: "aim")
            multipartFormData.append(aimData!, withName: "aim")
            multipartFormData.append(departmentData!, withName: "department")
            multipartFormData.append(areaData!, withName: "area")
            
        }, to: URL, method: .put, headers: header)
        {(encodingResult) in
            
            switch encodingResult{
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
                upload.responseData(completionHandler: { (res) in
                    switch res.result{
                    case .success:
                        if let value = res.result.value {
                            let message = JSON(value)["message"].string
                            if message == "update success"{
                                completion(message!)
                            }
                        }
                        break
                    case .failure(let err):
                        print(err.localizedDescription)
                        break
                    }
                })
            case .failure(let err):
                print(err.localizedDescription)
            }
            
        }
    }
    
//            multipartFormData.append(img_urlData!, withName: "img", fileName: "img.jpg" , mimeType: "image/jpeg")
//
//        }, to: URL, method: .post, headers: header)
//        { (encodingResult) in
//            print("ㅅㅂ")
//            switch encodingResult {
//
//            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
//                upload.responseData(completionHandler: { (res) in
//                    print("야호")
//                    switch res.result{
//                    case .success:
//                        print("야호")
//
//                        if let value = res.result.value {
//                            print(value)
//                            print(1)
//                            //   let json = response.result.value as? [String: Any]
//                            let message = JSON(value)["message"].string
//
//                            print(2)
//
//                            if message == "success"{
//                                print(3)
//                                completion(message!)
//                            }else if message == "fail"{
//                                print("fail")
//                            }else if message == "access denied"{
//                                print("just nothing")
//                            }else {
//                                print("shit")
//                            }
//
//                        }
//                        break
//                    case .failure(let err):
//                        print("개시발")
//                        print(err.localizedDescription)
//                    }
//
//                })
//
//            case .failure(let err):
//                print("젖같네")
//                print(err.localizedDescription)
//
//            }
//        }
//
//    }
//
//
    
    
    
    
    
    
    
    
    

}