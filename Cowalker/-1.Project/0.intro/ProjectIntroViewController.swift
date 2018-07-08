
import UIKit

class ProjectIntroViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var people = 1 // 참여자, 개설자 확인 변수
    var isClose = 0 //  참여종료 확인 변수
    
    @IBOutlet weak var projectCollectionView: UICollectionView! // 콜랙션
    @IBOutlet weak var partCollectionView: UICollectionView!
    @IBOutlet weak var underBar: UIToolbar! // 하단버튼
  //  @IBOutlet weak var barJoinBtn: UIBarButtonItem! // 하단버튼3

    @IBOutlet weak var constBtn: NSLayoutConstraint! // 상세 소개 제약
    @IBOutlet weak var constLabel: UILabel!
    @IBOutlet weak var collecViewH: NSLayoutConstraint!
    
    @IBOutlet weak var plusBtn: UIButton! // 더보기 버튼
    var isOpencheck = 0
    var isScraptCheck = 0
    
    @IBOutlet weak var scrView: UIScrollView!
    @IBOutlet weak var longBtn: UIBarButtonItem!
    @IBOutlet weak var plusPartBtn: UIButton!
    
    
    ////////////////////////////
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var aimLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false // 상단 바 보이게
        self.tabBarController?.tabBar.isHidden = true // 하단 탭바 삭제
        // 왼쪽 버튼
        let leftButton = UIBarButtonItem(title: "<Home", style: .plain, target: self, action: #selector(self.action))
        self.navigationItem.leftBarButtonItem = leftButton
        // 제약 설정
        constBtn.constant =  -constLabel.bounds.size.height
        collecViewH.constant = CGFloat((self.partList.count - 1)*88) + collecViewH.constant
        
        // 화면 아이템 설정, 롱 버튼 이미지, 플러스 버튼 유무
        
        if people == 0 { // 참여자일 때
            plusPartBtn.isHidden = true
            
             if isClose == 0{ // 모집 중
                longBtn.image = #imageLiteral(resourceName: "btnJoinProject.png")
             }else{ // 모집 완료
                longBtn.image = #imageLiteral(resourceName: "btnJoinProjectWaiting")
                longBtn.isEnabled = false
             }
        }else{ // 관리자일 때
            longBtn.image = #imageLiteral(resourceName: "btnProjectManage.png")
            plusPartBtn.isHidden = false
        }
    
        
        
        
        /////////페이징 기능---------------------------------------------------//
        /////////네비게이션 효과 기능---------------------------------------------------//
    
    }
    @objc func action(){ // 뒤로가기 버튼
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    /// 콜랙션뷰 변수
    var imageArray = [ #imageLiteral(resourceName: "1.png"), #imageLiteral(resourceName: "intro.png"), #imageLiteral(resourceName: "1.png")]
    var partList = ["개발자","디자이너","기획자","디자이너"]//,"개발자", "디자이너"]
    var numList = ["1명", "2명", "3명", "4명", "5명", "6명"]
    var ddayList = ["D - 1", "D - 2", "D - 3", "D - 4", "D - 5", "D - 6"]
    var detailList = ["웹,앱 서비스 개발", "로고 및 앱 디자인", "웹,앱 서비스 개발", "웹,앱 서비스 개발", "웹,앱 서비스 개발"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        /*
        if collectionView == projectCollectionView {return imageArray.count }
        else {return partList.count }*/
        return imageArray.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == projectCollectionView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCollectionViewCell", for: indexPath) as! ProjectCollectionViewCell
        cell.projectImage.image = imageArray[indexPath.row]
            return cell}
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartCollectionViewCell", for: indexPath) as! PartCollectionViewCell
            cell.partLabel.text = partList[indexPath.row]
            cell.partNumLabel.text = numList[indexPath.row]
            cell.dDayLabel.text = ddayList[indexPath.row]
            cell.detailLabel.text = detailList[indexPath.row]
            return cell}
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == projectCollectionView {
            return CGSize(width:self.view.frame.width, height: 375*self.view.frame.height/1100)}
        else{
            return CGSize(width: 200*self.view.frame.width/375, height: 50*self.view.frame.height/1100)}
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0}
    // 셀 클릭시
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 화면이동
        let secondVC = UIStoryboard(name: "Detail", bundle:nil ).instantiateViewController(withIdentifier: "ProjectPartDetailViewController") as! ProjectPartDetailViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
        // 자료 전달
        
    }

    // 사진, 이름 클릭했을 때, 프로필 이동
    @IBAction func goToProfile(_ sender: UIButton) {
        if people == 0 { // 참여자일 때
        // 프로필로 이동----------------------------------------------//
        }else{ // 개설자일 때
        }
    }
    // 스크랩 버튼 //////////
    @IBAction func scrapAct(_ sender: UIButton) {
        // 스크랩 기능
        if isScraptCheck == 0{
            sender.setImage(#imageLiteral(resourceName: "iconScrapYellow.png"), for: .normal)
            isScraptCheck = 1
            // 스크랩 하기기능추가----------------------------------------------//
        }else{
            sender.setImage(#imageLiteral(resourceName: "iconScrapDarkgray.png"), for: .normal)
            isScraptCheck = 0
            // 스크랩 취소기능추가----------------------------------------------//
        }
    }
    // 여정 버튼
    @IBAction func fullAct(_ sender: UIButton) {
        // 여정 화면으로 이동하기
    }
    // 더보기 버튼
    @IBAction func btnClickAct(_ sender: UIButton) {
        if isOpencheck == 0 { // 닫->여
            isOpencheck = 1
            constBtn.constant = 5
            plusBtn.setImage(#imageLiteral(resourceName: "iconReadMoreClose"), for: .normal)
        }else {
            isOpencheck = 0
            constBtn.constant = -constLabel.bounds.size.height
            plusBtn.setImage(#imageLiteral(resourceName: "iconReadMore"), for: .normal)}}
    // 플러스 버튼
    @IBAction func plusBtnAct(_ sender: UIButton) {
        // 화면 이동
        //
        let secondVC = UIStoryboard(name: "Project", bundle:nil ).instantiateViewController(withIdentifier: "RecruitPartViewController") as! RecruitPartViewController
        self.present(secondVC, animated: false, completion: nil)
        
    }
    // 추천 버튼
    @IBAction func recommendAct(_ sender: UIBarButtonItem) {
        // 화면 이동 // 미정
    }
    // 공유 버튼
    @IBAction func shareBtnAct(_ sender: UIBarButtonItem) {
        let shareTxt = "텍스트"
        let shareImg = #imageLiteral(resourceName: "iconsTabbar2Search")
        let shareItems = [shareTxt, shareImg] as [Any]
        let activityController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        self.present(activityController, animated: true, completion:  nil)
        // 페이스북,카카오 추가하기 ---------------------------------------------//
    }
    // 하단 관리 버튼 // 참여자, 관리자 일때
    @IBAction func tabBtnACt(_ sender: UIBarButtonItem) {
        if people == 0 { // 참여자
            let secondVC = UIStoryboard(name: "Apply", bundle:nil ).instantiateViewController(withIdentifier: "ProjectJoinViewController") as! ProjectJoinViewController
            self.navigationController?.pushViewController(secondVC, animated: true)
            }else if people == 1{ // 관리자
            // 알림 창 띄우기
            let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let firstAction: UIAlertAction = UIAlertAction(title: "프로젝트 수정", style: .default) { action -> Void in
                editAct()}
            let secondAction: UIAlertAction = UIAlertAction(title: "프로젝트 삭제", style: .default) { action -> Void in
                deleteAct()}
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }
            actionSheetController.addAction(firstAction)
            actionSheetController.addAction(secondAction)
            actionSheetController.addAction(cancelAction)
            present(actionSheetController, animated: true, completion: nil)
            func editAct(){// 수정
               // 프로젝트 수정화면으로 이동
            }
            func deleteAct(){// 삭제
                let dialog = UIAlertController(title: "프로젝트 삭제", message: "삭제하겠습니다.", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
                dialog.addAction(action)
                self.present(dialog, animated: true, completion: nil)
                // 프로젝트 삭제
            }
        }
    }
}


