//
//  ProjectMemberViewController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 2..
//  Copyright © 2018년 조예원. All rights reserved.
//

import UIKit
import Kingfisher
//참여멤버

class ProjectMemberViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var memberTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "참여 멤버"
        memberInit()
    }
    var add = "" // 이전 뷰에서 아이디 값 가져온다.
    
    var projectMembers: [ProjectMem] = [ProjectMem]()
    func memberInit(){
        ProjectMemService.projectMemInit(add: add) { (members) in
            self.projectMembers = members
            self.memberTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectMembers.count // 프로젝트 참여자 수만큼 테이블 뷰 생성된다.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"memTableViewCell") as! memTableViewCell
        //
        cell.memImg?.kf.setImage(with: URL(string: gsno(projectMembers[indexPath.section].profile_url)), placeholder: UIImage())
        cell.nameLabel.text = projectMembers[indexPath.section].name
        cell.partLabel.text = projectMembers[indexPath.section].position
        return cell
    }
}
