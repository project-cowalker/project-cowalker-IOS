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

    // 타인이 보거나 내가 보거나 둘다 된다@@@@@@@@@@@@@@@@@@@@
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    static func myPageInit(tempUrl: String, completion: @escaping([MyPage]) -> Void){
     
        
        let URL = url("/mypage"+tempUrl)

        let header: [String : String] = [
            "authorization" : UserDefaults.standard.string(forKey: "token")!
        ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseData() { res in
            switch res.result{
            case .success:
                if let value = res.result.value {
                    let decoder = JSONDecoder()
                    do {
                        print(11111)
                        let myPageData = try decoder.decode(MyPageData.self, from: value)
                        if myPageData.message == "success"{
                            print("가져옴")
                            completion(myPageData.data)
                            
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

    static func otherMyPageInit(tempUrl: String, completion: @escaping([OtherMyPage]) -> Void){
        
        
        let URL = url("/mypage"+tempUrl)
        
        let header: [String : String] = [
            "authorization" : UserDefaults.standard.string(forKey: "token")!
        ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseData() { res in
            switch res.result{
            case .success:
                if let value = res.result.value {
                    let decoder = JSONDecoder()
                    do {
                        print(11111)
                        let myPageData = try decoder.decode(OtherMyPageData.self, from: value)
                        if myPageData.message == "success"{
                            print("가져옴")
                            completion(myPageData.data)
                            
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
    static func myPageEdit(profile_img: UIImage, background_img: UIImage, name: String, position: String, introduce: String, portfolio_url: String, aim: String, department: String, area: String, completion: @escaping (String) -> Void){
        let URL = url("/mypage")
        let profile_imgData = UIImageJPEGRepresentation(profile_img, 0.3)
        let background_imgData = UIImageJPEGRepresentation(background_img, 0.3)
        let nameData = name.data(using: .utf8)
        let positionData = position.data(using: .utf8)
        let introduceData = introduce.data(using: .utf8)
        let portfolio_urlData = portfolio_url.data(using: .utf8)
        let aimData = aim.data(using: .utf8)
        let departmentData = department.data(using: .utf8)
        let areaData = area.data(using: .utf8)
//        let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJpYXQiOjE1MzA2NzAxNTMsImV4cCI6MTUzMzI2MjE1M30.BdRb0yary7AY8_yi8MDRDXuXrW19QSqRJI-9Xin3SXs"]
        let header: [String : String] = [
            "authorization" : UserDefaults.standard.string(forKey: "token")!
        ]
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(profile_imgData!, withName: "profile_img", fileName: "profile_img.jpg", mimeType: "image/jpeg")
            multipartFormData.append(background_imgData!, withName: "background_img", fileName: "background_img.jpg", mimeType: "image/jpeg")
            multipartFormData.append(nameData!, withName: "name")
            multipartFormData.append(positionData!, withName: "position")
            multipartFormData.append(introduceData!, withName: "introduce")
            multipartFormData.append(portfolio_urlData!, withName: "portfolio_url")
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
                            print("message 확인")
                            print(message)
                            if message == "update success"{
                                print("success")
                                completion(message!)
                            }
                        }
                        break
                    case .failure(let err):
                        print(111111111)
                        print(err.localizedDescription)
                        break
                    }
                })
            case .failure(let err):
                print(err.localizedDescription)
            }
            
        }
    }
    
    // @@@@@@@@ 개설한 프로젝트 남이  보는거면 urlTemp 에 user_idx 날려야함
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    
    static func iMadeProject(urlTemp: String, completion: @escaping([IMadeProject]) -> Void ){
        
        let URL = url("/user/project"+urlTemp)
//        let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJpYXQiOjE1MzA2NzAxNTMsImV4cCI6MTUzMzI2MjE1M30.BdRb0yary7AY8_yi8MDRDXuXrW19QSqRJI-9Xin3SXs"]
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
                    do {
                        let madeProject = try decoder.decode(IMadeProjectData.self, from: value)
                        
                        if madeProject.message == "success"{
                            
                            completion(madeProject.result)
                        }
                    }catch let err {
                        print(err)
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
            
        }
    }
    //@@@@@@@@@@@@@@@@@@ 내가 지원한 프로젝트 , 내가 참여한 프로젝트 둘다 쓸 수 있음
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    // 타인 마이페이지 보는 경우에 url = /user_idx 추가 하기
    static func participateProject(urlTemp: String,completion: @escaping ([ParticipatedProject]) -> Void){
        let URL = url(urlTemp)
//        let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJpYXQiOjE1MzA2NzAxNTMsImV4cCI6MTUzMzI2MjE1M30.BdRb0yary7AY8_yi8MDRDXuXrW19QSqRJI-9Xin3SXs"]
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
                    do {
                        let participateProject = try decoder.decode(ParticipatedProjectData.self, from: value)
                        if participateProject.message == "success" {
                            print("success")
                            completion(participateProject.result)
                        }else{
                            print("fail")
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
    
    
    
    //@@ 내가 나의 소개 페이지 보는 경우@@@@@@@@@@@@@@@@@@@
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    //+++++++++++++++타인이 소개 페이지 보는 경우도 -> url: intro/user_idx
    
    static func seeMyPageMySelf(urlTemp: String, completion: @escaping(IntroPage) -> Void){
        let URL = url("/intro"+urlTemp)
//        let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxNTAsImlhdCI6MTUzMTQwMTIzMSwiZXhwIjoxNTMzOTkzMjMxfQ.6Yx78kfxxjnuPJg5DxuMVvCPiojeC7jIPrYmI-isafo"]
        let header: [String : String] = [
            "authorization" : UserDefaults.standard.string(forKey: "token")!
        ]
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseData() { res in
            switch res.result {
            case .success:
                if let value = res.result.value {
                    let decoder = JSONDecoder()
                    
                    do {
                        let introPage = try decoder.decode(IntroPageData.self, from: value)
                        
                        if introPage.message == "success"{
                           
                            completion(introPage.result)
                        }
                    }catch let err {
                        print(err)
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
            
        }
        
    }
    
//    @@@@@@@@@@@@ 나의 소개페이지작성  intro  put요청
//    "contents" : "안녕하세요... 자기소개 문구....",
//    "img" : ["이미지", "이미지"]
    static func myPageIntroEdit(img: [UIImage],contents: String, completion: @escaping (String) -> Void){
        let URL = url("/intro")
        let contentsData = contents.data(using: .utf8)
        var imgData = [UIImage]()
//        let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxNTAsImlhdCI6MTUzMTQwMTIzMSwiZXhwIjoxNTMzOTkzMjMxfQ.6Yx78kfxxjnuPJg5DxuMVvCPiojeC7jIPrYmI-isafo"]
        let header: [String : String] = [
            "Authorization" : UserDefaults.standard.string(forKey: "token")!
        ]
        for  i in 0 ..< img.count{
            imgData.append(img[i])
        }
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for  i in 0 ..< img.count{
                let temp = UIImageJPEGRepresentation(imgData[i], 0.3)
                multipartFormData.append(temp!, withName: "img", fileName: "img.jpg", mimeType: "img/jpeg")
            }

            

            multipartFormData.append(contentsData!, withName: "contents")
           
        }, to: URL, method: .put, headers: header)
        {(encodingResult) in
            
            switch encodingResult{
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
                upload.responseData(completionHandler: { (res) in
                    switch res.result{
                    case .success:
                        if let value = res.result.value {
                            print(value)
                            let message = JSON(value)["message"].string
                            
                            if message == "update myIntro success"{
                                print("success@@@@@@@@@@@")
                                completion(message!)
                            }else{
                                print("message denied")
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
    
    
}
    
    
    

    

    


