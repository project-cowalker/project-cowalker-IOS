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
        funcForNavigationBar()
    }
    func funcForNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false // 상단 바 보이게
        self.tabBarController?.tabBar.isHidden = true // 하단 탭바 삭제
        let leftButtonItem = UIBarButtonItem(image: UIImage(named: "iconCaretLeftDarkgray"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(popAction))
        leftButtonItem.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = leftButtonItem}
    @objc func popAction(){ // 뒤로가기 버튼
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = false}
    
    
    var add = "" // 이전 뷰에서 아이디 값 가져온다.
    
    var projectMembers: [ProjectMem] = [ProjectMem]()
    func memberInit(){
        ProjectMemService.projectMemInit(add: add) { (members) in
            self.projectMembers = members
            self.memberTable.reloadData()
            print("ddd")
            print(members)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectMembers.count // 프로젝트 참여자 수만큼 테이블 뷰 생성된다.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"memTableViewCell") as! memTableViewCell
        cell.memImg?.kf.setImage(with: URL(string: gsno(projectMembers[indexPath.row].profile_url)), placeholder: UIImage())
        cell.nameLabel.text = projectMembers[indexPath.row].name
        cell.partLabel.text = projectMembers[indexPath.row].position
        return cell
    }
}
