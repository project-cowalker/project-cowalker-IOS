//
//  ProjectMemberViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit
//참여멤버

class ProjectMemberViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var memberTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "참여 멤버"
    }
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier:"memTableViewCell") as! memTableViewCell
        
            return cell
    }
}
