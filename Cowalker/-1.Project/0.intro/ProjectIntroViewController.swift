
import UIKit

class ProjectIntroViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"RecoTableViewCell") as! RecoTableViewCell
        
        
        //
        if indexPath.section == 0{
            cell.label1.text = "전체 프로젝트"
        }else{
            cell.label1.text = "파트"
        }
        cell.btnCheck.setImage(#imageLiteral(resourceName: "check.png"), for: .normal)
        return cell
        
    }
    
    @IBOutlet weak var recoTableView: UITableView!
    
    @IBOutlet weak var projectCollectionView: UICollectionView! // 콜랙션
    @IBOutlet weak var partCollectionView: UICollectionView!
    @IBOutlet weak var underBar: UIToolbar! // 하단탭
    @IBOutlet weak var longBtn: UIBarButtonItem!
    @IBOutlet weak var plusPartBtn: UIButton!
    //
    @IBOutlet weak var constBtn: NSLayoutConstraint! // 상세 소개 제약
    @IBOutlet weak var constLabel: UILabel!
    @IBOutlet weak var collecViewH: NSLayoutConstraint!
    @IBOutlet weak var scrView: UIScrollView!
    @IBOutlet weak var constTest: NSLayoutConstraint!
    @IBOutlet weak var constTest2: NSLayoutConstraint!
    //
    @IBOutlet weak var plusBtn: UIButton! // 더보기 버튼
    var isOpencheck = 0
    
    @IBOutlet weak var titleLabel: UILabel! // 라벨
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var aimLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImg: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false // 상단 바 보이게
        self.tabBarController?.tabBar.isHidden = true // 하단 탭바 삭제
        let leftButton = UIBarButtonItem(title: "<Home", style: .plain, target: self, action: #selector(self.action)) // 왼쪽 버튼 설정
        self.navigationItem.leftBarButtonItem = leftButton
        self.popView.layer.cornerRadius = 10
        constTest.constant = 0
        projectInit()
    }
    var tempProjectId = "" // 이전뷰에서 값 전달받는다.
    var tempRecruitId = ""
    var tempImgCount = 0
    var tempIsUser = ""
    var tempProjectDetails: [ProjectDetail] = [ProjectDetail]()
    var tempList = 0
    var tempRecruitLists : [RecruitList] = [RecruitList]()
    func projectInit(){
        CreateNewProjectService.getProjectDeatil(project_idx: tempProjectId){ (projectDetails, temp) in
            self.tempProjectDetails = projectDetails
            self.tempImgCount = self.tempProjectDetails[0].img_url!.count
            self.tempIsUser = temp // 사용자 값 저장
            self.btnIs() // 사용자값에 따라서장
            self.projectCollectionView.reloadData()
        }
        RecruitService.recruitList(add: tempProjectId){ (recruitLists) in
            self.tempRecruitLists = recruitLists
            self.tempList = self.tempRecruitLists.count
            self.const() // 모집컬랙션뷰 크기 처리함수
            self.partCollectionView.reloadData()
           // self.tempRecruitId = recruitLists
        }
    }
    func btnIs(){
        if tempIsUser == "개발자"{
            plusPartBtn.isHidden = false
            longBtn.image = #imageLiteral(resourceName: "btnProjectManage.png")
        }else{
            plusPartBtn.isHidden = true
            if tempIsUser == "참여하기"{
                longBtn.image = #imageLiteral(resourceName: "btnJoinProject")
            }else if tempIsUser == "참여대기"{
                longBtn.image = #imageLiteral(resourceName: "btnJoinProjectWaiting")
                longBtn.isEnabled = false
            }else if tempIsUser == "참여완료"{
                longBtn.image = #imageLiteral(resourceName: "btnJoinProjectDone")
                longBtn.isEnabled = false
            }
        }
        self.titleLabel.text = tempProjectDetails[0].title
        self.summaryLabel.text = tempProjectDetails[0].summary
        self.areaLabel.text = tempProjectDetails[0].area
        self.departmentLabel.text = tempProjectDetails[0].department
        self.aimLabel.text = tempProjectDetails[0].aim
        self.explainLabel.text = tempProjectDetails[0].explain
        self.nameLabel.text = tempProjectDetails[0].project_user_name
        //  self.profileImg.image = tempProjectDetails[0].project_user_profile_url
        self.profileImg?.kf.setImage(with: URL(string: gsno(tempProjectDetails[0].project_user_profile_url)), for: .normal, placeholder: UIImage())
    }
    func const(){
        collecViewH.constant = CGFloat((tempList - 1)*88) + collecViewH.constant
    }
    ////////////////////////////////
    @IBOutlet weak var labelDetail: UILabel!
    @IBAction func btnClickAct(_ sender: UIButton) {// 더보기 버튼
        if isOpencheck == 0 { //// 닫->여
            isOpencheck = 1
            constTest.constant = labelDetail.bounds.size.height
            plusBtn.setImage(#imageLiteral(resourceName: "iconReadMoreClose"), for: .normal)
        }else {
            isOpencheck = 0
            constTest.constant = 0
            plusBtn.setImage(#imageLiteral(resourceName: "iconReadMore"), for: .normal)}}

    /// 콜랙션뷰 변수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == projectCollectionView {
            return tempImgCount
        }else{ return tempList}
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == projectCollectionView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCollectionViewCell", for: indexPath) as! ProjectCollectionViewCell
            
            //
            cell.projectImage?.kf.setImage(with: URL(string: gsno(tempProjectDetails[0].img_url![indexPath.row])), placeholder: UIImage()) // 이미지 배열 처리 먹이기
            
            return cell}
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartCollectionViewCell", for: indexPath) as! PartCollectionViewCell
            cell.partLabel.text = tempRecruitLists[indexPath.row].position
            cell.partNumLabel.text = String(self.tempRecruitLists[indexPath.row].number)
            cell.dDayLabel.text =  String(self.tempRecruitLists[indexPath.row].dday)
            cell.detailLabel.text = self.tempRecruitLists[indexPath.row].task
            return cell}
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == partCollectionView {
            let secondVC = UIStoryboard(name: "Detail", bundle:nil ).instantiateViewController(withIdentifier: "ProjectPartDetailViewController") as! ProjectPartDetailViewController
            self.navigationController?.pushViewController(secondVC, animated: true)
            // 자료 전달 // 프로젝트아이디, 리크룻아이디 전송
            secondVC.tempRecruitId = self.tempRecruitLists[indexPath.section].recruit_idx// 다음 뷰로 모집아이디 전송
            secondVC.tempProjectId = self.tempProjectId
            
            secondVC.tempUser = tempIsUser
            /*
            if tempIsUser == "개발자"{
                secondVC.tempUser = "개발자"
            }else{
                secondVC.tempUser = "참여자"
            }*/
            
            secondVC.temp1 = self.tempRecruitLists[indexPath.section].position
            secondVC.temp2 = String(self.tempRecruitLists[indexPath.section].number)
            secondVC.temp3 = self.tempRecruitLists[indexPath.section].task
            secondVC.temp4 = String(self.tempRecruitLists[indexPath.section].dday)
        }
    }
    @IBAction func tabBtnACt(_ sender: UIBarButtonItem) {
        if tempIsUser == "개발자" {
            // 알림 창 띄우기
            let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let firstAction: UIAlertAction = UIAlertAction(title: "프로젝트 수정", style: .default) { action -> Void in
                editAct()}
            let secondAction: UIAlertAction = UIAlertAction(title: "프로젝트 삭제", style: UIAlertActionStyle.destructive) { action -> Void in
                deleteAct()}
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }
            actionSheetController.addAction(firstAction)
            actionSheetController.addAction(secondAction)
            actionSheetController.addAction(cancelAction)
            present(actionSheetController, animated: true, completion: nil)
            func editAct(){// 수정
            }
            func deleteAct(){// 삭제
                let dialog = UIAlertController(title: "프로젝트 삭제", message: "삭제하겠습니다.", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
                dialog.addAction(action)
                self.present(dialog, animated: true, completion: nil)
            }
        }else { // 참여하기 페이지로 이동
            let secondVC = UIStoryboard(name: "Apply", bundle:nil ).instantiateViewController(withIdentifier: "ProjectJoinViewController") as! ProjectJoinViewController
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
    @objc func action(){ // 뒤로가기 버튼
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    @IBAction func goToProfile(_ sender: UIButton) {// 사진,이름 클릭 프로필이동
       
    }
    @IBAction func plusBtnAct(_ sender: UIButton) {// 플러스 버튼
        let secondVC = UIStoryboard(name: "Project", bundle:nil ).instantiateViewController(withIdentifier: "RecruitPartViewController") as! RecruitPartViewController
        self.present(secondVC, animated: false, completion: nil)
    }
    @IBAction func shareBtnAct(_ sender: UIBarButtonItem) { // 공유버튼
        let shareTxt = "텍스트"
        let shareImg = #imageLiteral(resourceName: "iconsTabbar2Search")
        let shareItems = [shareTxt, shareImg] as [Any]
        let activityController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        self.present(activityController, animated: true, completion:  nil)
        // 페이스북,카카오 추가하기 ---------------------------------------------//
    }
    
    //
    @IBOutlet var popView: UIView!
    @IBAction func recommendAct(_ sender: UIBarButtonItem) {
     //   let dimAlphaRedColor =  UIColor.red.withAlphaComponent(0.7)
       // self.view.backgroundColor =  dimAlphaRedColor
        
        self.view.addSubview(popView)
        popView.center.x = self.view.center.x
        popView.center.y = self.view.center.y + CGFloat(100)
        
    }
    @IBAction func popDoneAct(_ sender: Any) {
        self.popView.removeFromSuperview()
    }
}


