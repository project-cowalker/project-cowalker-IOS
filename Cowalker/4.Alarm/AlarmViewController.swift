//
//  AlarmViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit
import Kingfisher
import UserNotifications
class AlarmViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var alarmTableView: UITableView!
    var num = 0
    var message: [Message] = [Message]()
    
    @IBOutlet weak var label1: UIButton!
    @IBOutlet weak var label2: UIButton!
    @IBOutlet weak var img1: UIView!
    @IBOutlet weak var img2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "알림"
        
        label2.setTitleColor(UIColor.lightGray, for: .normal)
        label1.setTitleColor(UIColor.black, for: .normal)
        img2.isHidden = true
        img1.isHidden = false
        MessageService.getNewAlarm { (NewAlarm) in
            self.alarm = NewAlarm
            self.alarmTableView.reloadData()
        }
        
        self.tabBarController?.tabBar.tintColor = UIColor (red: 69.0/255.0, green: 182.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        self.tabBarController?.tabBar.items![3].image = #imageLiteral(resourceName: "iconsTabbar4Alarm")
        
        let badgeCount: Int = 0
        let application = UIApplication.shared
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
            // Enable or disable features based on authorization.
        }
        application.registerForRemoteNotifications()
        application.applicationIconBadgeNumber = badgeCount
    }
    override func viewWillAppear(_ animated: Bool) {
        alarmViewControllerInit()
    }
    var alarm: [NewAlarm] = [NewAlarm]()
    @IBAction func button1(_ sender: UIButton) {
        num = 0
        
        img1.isHidden = false
        img2.isHidden = true
        alarmTableView.reloadData()
        
        label2.setTitleColor(UIColor.lightGray, for: .normal)
        label1.setTitleColor(UIColor.black, for: .normal)
        MessageService.getNewAlarm { (NewAlarm) in
            self.alarm = NewAlarm
            self.alarmTableView.reloadData()
            
        }
        
    }
    @IBAction func button2(_ sender: UIButton) {
        num = 1
        img1.isHidden = true
        img2.isHidden = false
//        alarmTableView.reloadData()
        label2.setTitleColor(UIColor.black, for: .normal)
        label1.setTitleColor(UIColor.lightGray, for: .normal)
        MessageService.messageInit { (message) in
          
            self.message = message
            self.alarmTableView.reloadData()
            
        }
        print(message.count)
    }
    func alarmViewControllerInit(){
        MessageService.messageInit { (message) in
            
            self.message = message
            self.alarmTableView.reloadData()
            
        }
        MessageService.getNewAlarm { (NewAlarm) in
            self.alarm = NewAlarm
            self.alarmTableView.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if num == 0 {
            return alarm.count
        }else {
            return message.count
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if num == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier:"alarmTableViewCell") as! alarmTableViewCell
            cell.project_name.text = alarm[indexPath.row].project_name!
            cell.contents.text = alarm[indexPath.row].contents!
            cell.create_at.text = alarm[indexPath.row].time!
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "MM/dd HH:mm"
//            cell.create_at.text = dateFormatter.string(from: alarm[indexPath.row].create_at)
            
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier:"chattingTableViewCell") as! chattingTableViewCell
            
            // 이때 partner_idx 받을 수 있다~~~~~~~ 이거 체크하기@@@@@@@@@@@@
            // 쪽지 보낼때 필요한 값

            cell.profileImage.kf.setImage(with: URL(string: gsno(message[indexPath.row].partner_profile_url)), placeholder: #imageLiteral(resourceName: "imgProfileDefault.png"))
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "MM/dd HH:mm"
//            cell.timeLabel.text = dateFormatter.string(from: message[indexPath.row].create_at)
            cell.timeLabel.text = message[indexPath.row].time!
            cell.messageFromLabel.text = message[indexPath.row].partner_name
            cell.messageLabel.text = message[indexPath.row].contents
            
            return cell
        }
    }
    var partner_idx = 0
    var partner_name = ""
    
    // 새소식 외에 쪽지가 선택 됫을때로 바꾸기 아마 push action 해야할지도
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if num == 1{
            if let secondVC = storyboard?.instantiateViewController(withIdentifier: "AlarmSecondViewController") as? AlarmSecondViewController{
                partner_idx = message[indexPath.row].partner_idx
                partner_name = message[indexPath.row].partner_name!
                
                secondVC.partner_idx = partner_idx
                print(partner_name)
                print(partner_idx)
                secondVC.partner_name = partner_name
                //더 보기로 이동
                
                self.navigationController?.pushViewController(secondVC, animated: true)
                
                
            }

        }
       
        
    }
    
}

