//
//  AlarmViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 1..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit
import Kingfisher
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
        
        
        self.tabBarController?.tabBar.tintColor = UIColor (red: 100.0/255.0, green: 223.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        self.tabBarController?.tabBar.items![3].image = #imageLiteral(resourceName: "iconsTabbar4Alarm")
    }
    
    @IBAction func button1(_ sender: UIButton) {
        num = 0
        
        img1.isHidden = false
        img2.isHidden = true
        alarmTableView.reloadData()
        
        label2.setTitleColor(UIColor.lightGray, for: .normal)
        label1.setTitleColor(UIColor.black, for: .normal)
        
    }
    @IBAction func button2(_ sender: UIButton) {
        num = 1
        img1.isHidden = true
        img2.isHidden = false
//        alarmTableView.reloadData()
        label2.setTitleColor(UIColor.black, for: .normal)
        label1.setTitleColor(UIColor.lightGray, for: .normal)
        MessageService.messageInit { (message) in
            print(33333)
            print(message)
            self.message = message
            self.alarmTableView.reloadData()
            
        }
        print(message.count)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if num == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier:"alarmTableViewCell") as! alarmTableViewCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier:"chattingTableViewCell") as! chattingTableViewCell
            
            // 이때 partner_idx 받을 수 있다~~~~~~~ 이거 체크하기@@@@@@@@@@@@
            // 쪽지 보낼때 필요한 값

            cell.profileImage.kf.setImage(with: URL(string: gsno(message[indexPath.row].partner_profile_url)), placeholder: UIImage())
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd HH:mm"
            cell.timeLabel.text = dateFormatter.string(from: message[indexPath.row].create_at)
            cell.messageFromLabel.text = message[indexPath.row].partner_name
            cell.messageLabel.text = message[indexPath.row].contents
            return cell
        }
    }
    
    // 새소식 외에 쪽지가 선택 됫을때로 바꾸기 아마 push action 해야할지도
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if num == 1{
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "AlarmSecondNaviController")

            present(nextView, animated: true, completion: nil)
        }
       
        
    }
    
}

