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
    static func createNewProject(title: String, summary: String, area: String, department: String, aim: String ,explain: String, img: [UIImage], completion: @escaping (String) -> Void){
        let URL = url("/project")
//        let userdefault = UserDefaults.standard
        let titleData = title.data(using: .utf8)
        let summaryData = summary.data(using: .utf8)
        let areaData = area.data(using: .utf8)
        let departmentData = department.data(using: .utf8)
        let aimData = aim.data(using: .utf8)
        var imgData = [UIImage]()
        let explainData = explain.data(using: .utf8)
        for  i in 0 ..< img.count{
            imgData.append(img[i])
        }
//        Alamofire.upload(multipartFormData: { (multipartFormData) in
//            for  i in 0 ..< img_url.count{
//                let temp = UIImageJPEGRepresentation(imgData[i], 0.3)
//                multipartFormData.append(temp!, withName: "img_url", fileName: "img_url.jpg", mimeType: "img_url/jpeg")
//            }
//        let img_urlData = UIImageJPEGRepresentation(img_url, 0.3)
//
        //token 처리도 해야함 유저로 가게
//        let header: [String : String] = [
//            "authorization" : UserDefaults.standard.string(forKey: "token")!
//        ]
        let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozNCwiaWF0IjoxNTMwODkzOTEyLCJleHAiOjE1MzM0ODU5MTJ9.mgiKKWAUaCYiqn2hC77-T9VWYJdE2N8tpLNqw3MAVWA"]
//        print(UserDefaults.standard.string(forKey: "email"))
//        print(UserDefaults.standard.string(forKey: "token"))
//        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyLCJpYXQiOjE1MzA2NzAxNTMsImV4cCI6MTUzMzI2MjE1M30.BdRb0yary7AY8_yi8MDRDXuXrW19QSqRJI-9Xin3SXs"
//        let header = ["authorization" : token]
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for  i in 0 ..< img.count{
                let temp = UIImageJPEGRepresentation(imgData[i], 0.3)
                multipartFormData.append(temp!, withName: "img", fileName: "img.jpg", mimeType: "img/jpeg")
            }
            multipartFormData.append(titleData!, withName: "title")
            multipartFormData.append(summaryData!, withName: "summary")
            multipartFormData.append(areaData!, withName: "area")
            multipartFormData.append(departmentData!, withName: "department")
            multipartFormData.append(aimData!, withName: "aim")
            multipartFormData.append(explainData!, withName: "explain")
//            multipartFormData.append(img_urlData!, withName: "img", fileName: "img.jpg" , mimeType: "image/jpeg")
            
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
//                                print(UserDefaults.standard.string(forKey: "token"))
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
    

   

    //project 선택시 세부사항 정보들 볼 수 있게 조회 하는 함수@@@@@@@@@@@@@@@@@@@@
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    
    static func getProjectDeatil(project_idx: String,completion: @escaping ([ProjectDetail],String) -> Void){
//        let header: [String : String] = [
//            "authorization" : UserDefaults.standard.string(forKey: "token")!
//        ]
        let header = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozNCwiaWF0IjoxNTMwODkzOTEyLCJleHAiOjE1MzM0ODU5MTJ9.mgiKKWAUaCYiqn2hC77-T9VWYJdE2N8tpLNqw3MAVWA"]
        let URL = url("/project/"+project_idx)
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseData() { res in
            switch res.result {
            case .success:
                if let value = res.result.value {
                    print(value)
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSS'Z"
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    do {
                        print("dodododo")
                        let projectDetailData = try decoder.decode(ProjectDetailData.self, from: value)
                        print("2222")
                        if projectDetailData.message == "success"{
                            print("success")
                            completion(projectDetailData.result, projectDetailData.user)
                        }
                        
                    }catch let err{
                        print(err)
                        print("catch")
                    }
                }
                break
                
                
                
                
            case .failure(let err):
                print(err.localizedDescription)
            }
            
            
        }
        
        
    }
    //@@@@@@@@@@@@프로젝트 수정@@@@@@@@@@@@@@@@@@@@@
    // img 이거 배열이니깐 배열로 잘 처리해서 데이터 보내기
    // project 수정 못할경우가 해당 프로젝트가 없는 경우인데 그럴 일은 없으니깐
    // 경고알림으로 접근권한이 없다 이정도 해주는것도 괜춘할각
    // 저기 tempURL에는 project_idx 넘겨주기
    static func projectUpdate(tempURL: String,title: String, summary: String, area: String, department: String, aim: String, explain: String, img: [UIImage], completion: @escaping (String) -> Void){
        let URL = url("/project/"+tempURL)
        let titleData = title.data(using: .utf8)
        let summaryData = summary.data(using: .utf8)
        let areaData = area.data(using: .utf8)
        let departmentData = department.data(using: .utf8)
        let aimData = aim.data(using: .utf8)
        let explainData = explain.data(using: .utf8)
        var imgData = [UIImage]()
        for  i in 0 ..< img.count{
            imgData.append(img[i])
        }
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for  i in 0 ..< img.count{
                let temp = UIImageJPEGRepresentation(imgData[i], 0.3)
                multipartFormData.append(temp!, withName: "img", fileName: "img.jpg", mimeType: "img/jpeg")
            }
            multipartFormData.append(titleData!, withName: "title")
            multipartFormData.append(summaryData!, withName: "summary")
            multipartFormData.append(areaData!, withName: "area")
            multipartFormData.append(departmentData!, withName: "department")
            multipartFormData.append(aimData!, withName: "aim")
            multipartFormData.append(explainData!, withName: "explain")
           
        }, to: URL, method: .put, headers: nil ){
            (encodingResult) in
            switch encodingResult {
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
                upload.responseData(completionHandler: { (res) in
                    switch res.result {
                    case .success:
                        if let value = res.result.value {
                            let message = JSON(value)["message"].string
                            if message == "project updated"{
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
//    @@@@@@@@@@@@@@Project 삭제@@@@@@@@@@@@@@@@@@@@@
//    delete method 처음짜봐서 맞는지는 모르겠지만 맞을듯 @@@@@@@@@@@@@@@@@
    
    static func projectDelete(tempURL: String, completion: @escaping (String) -> Void){
        let URL = url("/project/"+tempURL)
        Alamofire.request(URL, method: .delete).responseData { (res) in
            switch res.result {
            case .success:
                if let value = res.result.value{
                    let message = JSON(value)["message"].string
                    if message == "delete success" {
                        completion(message!)
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
