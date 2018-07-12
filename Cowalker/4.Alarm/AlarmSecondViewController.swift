//
//  AlarmSecondViewController.swift
//  Cowalker
//
//  Created by 정보영 on 2018. 7. 4..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class AlarmSecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return individualMessage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageTableViewCell") as! messageTableViewCell
        cell.userLabel.text = individualMessage[indexPath.row].from_user_name
        cell.messageLabel.text = individualMessage[indexPath.row].contents
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd HH:mm"
        cell.timeLabel.text = dateFormatter.string(from: individualMessage[indexPath.row].create_at)
        
        return cell
        
    }
    override func viewWillAppear(_ animated: Bool) {
        messageTableInit()
        individualMessageTableView.reloadData()
        
    }
    
    @IBOutlet weak var individualMessageTableView: UITableView!
    
    var partner_idx = 0
    var partner_name = ""
    var individualMessage: [IndividualMessage] = [IndividualMessage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.3364960849, green: 0.3365047574, blue: 0.3365000486, alpha: 1)
        self.navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.3364960849, green: 0.3365047574, blue: 0.3365000486, alpha: 1)
        self.navigationItem.title = partner_name
        messageTableInit()
        self.navigationController?.isNavigationBarHidden = false
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func messageTableInit() {
        MessageService.individualMessageInit(partner_idx: partner_idx) { (individualMessageData) in
           
            self.individualMessage = individualMessageData
            self.individualMessageTableView.reloadData()
            
        }

    }
    
    @IBAction func sendingMessagePage(_ sender: Any) {
        
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "SendingMessageViewController") as? SendingMessageViewController{
            secondVC.partner_idx = partner_idx
            
            
            //더 보기로 이동
            
            self.navigationController?.pushViewController(secondVC, animated: true)
        }

        
    }
    
    
    
    @IBAction func goToBackPage(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    

    
    
    
    
    
}
