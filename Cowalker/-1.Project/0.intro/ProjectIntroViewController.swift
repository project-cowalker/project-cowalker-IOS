
import UIKit

class ProjectIntroViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var projectCollectionView: UICollectionView! // 콜랙션
    @IBOutlet weak var partCollectionView: UICollectionView!
    @IBOutlet weak var underBar: UIToolbar! // 하단탭
    @IBOutlet weak var longBtn: UIBarButtonItem!
    @IBOutlet weak var plusPartBtn: UIButton!

    @IBOutlet weak var collecViewH: NSLayoutConstraint!// 제약
    @IBOutlet weak var constTest: NSLayoutConstraint!
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
    //
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        projectInit()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        funcForNavigationBar()
        constTest.constant = 0
        projectInit()
        //print(tempProjectId)
        
    }
    func funcForNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false // 상단 바 보이게
        self.tabBarController?.tabBar.isHidden = true // 하단 탭바 삭제
        let leftButtonItem = UIBarButtonItem(image: UIImage(named: "iconCaretLeftDarkgray"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(popAction))
        leftButtonItem.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = leftButtonItem}
    
    @objc func popAction(){ // 뒤로가기 버튼
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = true}
    //
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
            
            print("존나떨려")
            print(self.tempIsUser)
        }
        RecruitService.recruitList(add: tempProjectId){ (recruitLists) in
            self.tempRecruitLists = recruitLists
            self.tempList = self.tempRecruitLists.count
            self.const() // 모집컬랙션뷰 크기 처리함수
            self.partCollectionView.reloadData()
            self.recoTableView.reloadData()
            print("testhere")
            print(self.tempList)
        }}
    func btnIs(){
        if tempIsUser == "개설자"{
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
            }}
        self.titleLabel.text = tempProjectDetails[0].title
        self.summaryLabel.text = tempProjectDetails[0].summary
        self.areaLabel.text = tempProjectDetails[0].area
        self.departmentLabel.text = tempProjectDetails[0].department
        self.aimLabel.text = tempProjectDetails[0].aim
        self.explainLabel.text = tempProjectDetails[0].explain
        self.nameLabel.text = tempProjectDetails[0].project_user_name
        self.profileImg?.kf.setImage(with: URL(string: gsno(tempProjectDetails[0].project_user_profile_url)), for: .normal, placeholder: UIImage())
    }
    func const(){
        if tempList == 0{
            collecViewH.constant = 30        }
        else{
            
            collecViewH.constant = CGFloat(tempList*110)
            //collecViewH.constant = CGFloat((tempList - 1)*88) + collecViewH.constant
        }
    }
    //
    @IBOutlet weak var labelDetail: UILabel!
    @IBAction func btnClickAct(_ sender: UIButton) {// 더보기 버튼
        if isOpencheck == 0 { //// 닫->여
            isOpencheck = 1
            constTest.constant = labelDetail.bounds.size.height + 20
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
            cell.projectImage?.kf.setImage(with: URL(string: gsno(tempProjectDetails[0].img_url![indexPath.row])), placeholder: UIImage())
            return cell}
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartCollectionViewCell", for: indexPath) as! PartCollectionViewCell
            cell.partLabel.text = tempRecruitLists[indexPath.row].position
            cell.partNumLabel.text = String(self.tempRecruitLists[indexPath.row].number) + "명"
            cell.dDayLabel.text =  "D " + self.tempRecruitLists[indexPath.row].dday
            cell.detailLabel.text = self.tempRecruitLists[indexPath.row].task
            return cell}}
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {//셀클릭
        if collectionView == partCollectionView {
            let secondVC = UIStoryboard(name: "Detail", bundle:nil ).instantiateViewController(withIdentifier: "ProjectPartDetailViewController") as! ProjectPartDetailViewController
            self.navigationController?.pushViewController(secondVC, animated: true)
            // 자료 전달 // 프로젝트아이디, 리크룻아이디 전송
            secondVC.tempRecruitId = self.tempRecruitLists[indexPath.row].recruit_idx // 다음 뷰로 모집아이디 전송
            secondVC.tempProjectId = self.tempProjectId
            secondVC.tempIndex = indexPath.row
            print("ㅅㅂㅅㅂ구일")
            print(secondVC.tempIndex)

        }}
    @IBAction func tabBtnACt(_ sender: UIBarButtonItem) {
        if tempIsUser == "개설자" {
            sender.isEnabled = true
            // 알림 창 띄우기
            let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
           /* let firstAction: UIAlertAction = UIAlertAction(title: "프로젝트 수정", style: .default) { action -> Void in
                editAct()}*/
            let secondAction: UIAlertAction = UIAlertAction(title: "프로젝트 삭제", style: UIAlertActionStyle.destructive) { action -> Void in
                deleteAct()}
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }
           // actionSheetController.addAction(firstAction)
            actionSheetController.addAction(secondAction)
            actionSheetController.addAction(cancelAction)
            present(actionSheetController, animated: true, completion: nil)
            func editAct(){// 프로젝트 수정
                
            }
            func deleteAct(){// 프로젝트 삭제
                let dialog = UIAlertController(title: "프로젝트 삭제", message: "삭제하겠습니다.", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default){ action -> Void in
                    deleteComplete()
                }
                dialog.addAction(action)
                self.present(dialog, animated: true, completion: nil)
                func deleteComplete(){
                    CreateNewProjectService.projectDelete(tempURL: tempProjectId){ (message) in
                        if message == "delete success"{
                            print("delete sucess")
                            let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
                            let vc = storyboard.instantiateViewController(withIdentifier: "MyTabViewController") as! MyTabViewController
                            self.present(vc, animated: false, completion: nil)
                        }
                    }
                    // 화면전환
                    
                }
            }
        }else { // 참여하기 페이지로 이동,
            if tempIsUser == "참여하기"{
                sender.isEnabled = true
                let secondVC = UIStoryboard(name: "Apply", bundle:nil ).instantiateViewController(withIdentifier: "ProjectJoinViewController") as! ProjectJoinViewController
                secondVC.tempProjectId = self.tempProjectId
                secondVC.tempRecruitId = self.tempRecruitId
                self.navigationController?.pushViewController(secondVC, animated: true)
            }else { //참여중, 참여완료
                sender.isEnabled = false
            }
        }}
    
    
    static var plusTempPi = ""
    
    @IBAction func plusBtnAct(_ sender: UIButton) {// 플러스 버튼, recruit로 이동
        
        let secondVC = UIStoryboard(name: "Recruit", bundle:nil ).instantiateViewController(withIdentifier: "RecruitNaviViewController") as! RecruitNaviViewController
        ProjectIntroViewController.plusTempPi = tempProjectId
        self.present(secondVC, animated: false, completion: nil)
    
    }

    ///-----------------------------------------------------------------------------------------91
    @IBAction func shareBtnAct(_ sender: UIBarButtonItem) { // 공유버튼
        let shareTxt = "텍스트"
        let shareImg = #imageLiteral(resourceName: "iconsTabbar2Search")
        let shareItems = [shareTxt, shareImg] as [Any]
        let activityController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        self.present(activityController, animated: true, completion:  nil)
        // 페이스북,카카오 추가하기
    }
    @IBOutlet var popView: UIView!
    @IBOutlet weak var whiteView: UIView!
    @IBAction func recommendAct(_ sender: UIBarButtonItem) {
        self.view.addSubview(popView)
        self.whiteView.layer.cornerRadius = 20
        popView.center.x = self.view.center.x
        popView.center.y = self.view.center.y + CGFloat(100)
    }
    @IBAction func popDoneAct(_ sender: Any) {
        // 데이터 전송하기
        self.popView.removeFromSuperview()
    }
    @IBOutlet weak var commentTv: UITextView!
    @IBOutlet weak var recoTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempRecruitLists.count+1 }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"RecoTableViewCell") as! RecoTableViewCell
        if indexPath.row == 0{
            cell.label1.text = "전체 프로젝트"
        }else{
            cell.label1.text = tempRecruitLists[indexPath.row-1].position
        }
        cell.btnCheck.setImage(#imageLiteral(resourceName: "check.png"), for: .normal)
        return cell
    }
    @IBAction func goToProfile(_ sender: UIButton) {// 사진,이름 클릭 프로필이동
        // 프로필로이동
        let secondVC = UIStoryboard(name: "Profile2", bundle:nil ).instantiateViewController(withIdentifier: "Profile2ViewController") as! Profile2ViewController
        
        secondVC.user_idx = tempProjectDetails[0].user_idx!
        self.present(secondVC, animated: false, completion: nil)
    }
}


