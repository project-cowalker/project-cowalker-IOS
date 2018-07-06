
import UIKit

class ProjectIntroViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // 참여자, 개설자
    var people = 0
    
    @IBOutlet weak var projectCollectionView: UICollectionView! // 콜랙션
    @IBOutlet weak var partCollectionView: UICollectionView!
    @IBOutlet weak var underBar: UIToolbar! // 하단버튼
  //  @IBOutlet weak var barJoinBtn: UIBarButtonItem! // 하단버튼3

    @IBOutlet weak var constBtn: NSLayoutConstraint! // 제약
    @IBOutlet weak var constLabel: UILabel!
    
    @IBOutlet weak var plusBtn: UIButton! // 더보기 버튼
    var isOpencheck = 0
    var isScraptCheck = 0
    
    @IBOutlet weak var scrView: UIScrollView!
    @IBOutlet weak var longBtn: UIBarButtonItem!
    
    @IBOutlet weak var plusPartBtn: UIButton!
    
    
    /// 콜랙션뷰 변수
    var imageArray = [ #imageLiteral(resourceName: "1.png"), #imageLiteral(resourceName: "intro.png"), #imageLiteral(resourceName: "1.png")]
    var partList = ["개발자","디자이너","기획자","디자이너"]//,"개발자", "디자이너"]
    var numList = ["1명", "2명", "3명", "4명", "5명", "6명"]
    var ddayList = ["D - 1", "D - 2", "D - 3", "D - 4", "D - 5", "D - 6"]
    var detailList = ["웹,앱 서비스 개발", "로고 및 앱 디자인", "웹,앱 서비스 개발", "웹,앱 서비스 개발", "웹,앱 서비스 개발"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true // 하단 탭바 삭제
        constBtn.constant =  -constLabel.bounds.size.height// 제약 설정
        // 왼쪽 버튼
        let leftButton = UIBarButtonItem(title: "<Home", style: .plain, target: self, action: #selector(self.action))
        self.navigationItem.leftBarButtonItem = leftButton //왼쪽버튼
        // 상단 바 보이게
        self.navigationController?.isNavigationBarHidden = false
        collecViewH.constant = CGFloat((self.partList.count - 1)*88) + collecViewH.constant
        // 롱 버튼 이미지 설정
        if people == 0 { // 참여자일 때, 참여하기
            longBtn.image = #imageLiteral(resourceName: "btnJoinProject.png")//
            plusPartBtn.isHidden = true
            //plusBtn.isEnabled = false
            /*
             if 참여완료{
                longBtn.image =
             }else{
                longBtn.image =
             }
             */
            
            
        }else{ // 관리자일 때, 프로젝트 관ㄴ리
            longBtn.image = #imageLiteral(resourceName: "btnProjectManage.png")
            plusPartBtn.isHidden = false
        }
        
        /////////페이징 기능---------------------------------------------------//
        /////////네비게이션 효과 기능---------------------------------------------------//
    }
    
    
    @objc func action(){
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    

    @IBOutlet weak var collecViewH: NSLayoutConstraint!
    
    // 컬랙션뷰
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == projectCollectionView {return imageArray.count }
        else {return partList.count }
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

    // 사진, 이름 클릭했을 때
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
    
    @IBAction func plusBtnAct(_ sender: UIButton) {
        // 화면 이동
        
        let secondVC = UIStoryboard(name: "Project", bundle:nil ).instantiateViewController(withIdentifier: "RecruitPartViewController") as! RecruitPartViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
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
    // 하단 관리 버튼
    // 참여자, 관리자 일때
    @IBAction func tabBtnACt(_ sender: UIBarButtonItem) {
        if people == 0 { // 참여자
            // 뷰 이동
            let secondVC = UIStoryboard(name: "Project", bundle:nil ).instantiateViewController(withIdentifier: "ProjectJoinViewController") as! ProjectJoinViewController
            self.navigationController?.pushViewController(secondVC, animated: true)
        }else if people == 1{ // 관리자
            
            // 알림 창 띄우기
            let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let firstAction: UIAlertAction = UIAlertAction(title: "프로젝트 수정", style: .default) { action -> Void in
                editAct()
            }
            let secondAction: UIAlertAction = UIAlertAction(title: "프로젝트 삭제", style: .default) { action -> Void in
                deleteAct()
            }
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

 /*
 let leftButton = UIBarButtonItem(title: "<Home", style: .plain, target: self, action: #selector(self.action))
 self.navigationItem.leftBarButtonItem = leftButton //왼쪽버튼

@objc func action(){
    self.navigationController?.popViewController(animated: true)
    self.tabBarController?.tabBar.isHidden = false
}
*/

/*
 // 버튼 이동
 @IBAction func detailBtnAction(_ sender: UIButton) {
 let secondVC = UIStoryboard(name: "Home", bundle:nil ).instantiateViewController(withIdentifier: "ProjectDetailViewController") as! ProjectDetailViewController
 self.navigationController?.pushViewController(secondVC, animated: true)
 }
 /*
 
 @IBAction func partBtnAction(_ sender: UIButton) {
 let secondVC = UIStoryboard(name: "Home", bundle:nil ).instantiateViewController(withIdentifier: "ProjectPartViewController") as! ProjectPartViewController
 self.navigationController?.pushViewController(secondVC, animated: true)
 }
 
 @IBAction func fullBtnAction(_ sender: UIButton) {
 let secondVC = UIStoryboard(name: "Home", bundle:nil ).instantiateViewController(withIdentifier: "ProjectFullViewController") as! ProjectFullViewController
 self.navigationController?.pushViewController(secondVC, animated: true)
 }*/
 
@IBAction func JoinBtnAct(_ sender: UIButton) {
    
    let secondVC = UIStoryboard(name: "Home", bundle:nil ).instantiateViewController(withIdentifier: "ProjectJoinViewController") as! ProjectJoinViewController
    self.navigationController?.pushViewController(secondVC, animated: true)
}*/

