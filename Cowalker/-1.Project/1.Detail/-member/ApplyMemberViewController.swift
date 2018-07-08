//
//  ApplyMemberViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 7..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit

class ApplyMemberViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //
    var applys: [Apply] = [Apply]()
    //
    @IBOutlet weak var applyTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "지원 멤버"
        
        // 화면 로드
        // applyInit()
    }
    
    func applyInit(){
        //ApplyService.applyInit
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"applyMemTableViewCell") as! applyMemTableViewCell
        //
        //cell.memImg =
        
        
        //
        
        return cell
    }
    
    @IBAction func replyBtnAct(_ sender: UIButton) {
        if sender.tag == 0{
            // 거절 버튼
            
        }else{
            // 수락 버튼
            
        }
    }
    

}















