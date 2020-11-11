import UIKit

enum IssueResultCellViewType {
    case IssueListResult
    case MultiSelectedView
}


class IssueResultCellView: UICollectionViewCell {
    
    var iid: Int?
    var isCheck: Bool = false
    
    @IBOutlet weak var detailView: IssueDetailedView!
    @IBOutlet weak var detailViewForMulti: IssueDetailedView!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    @IBAction func checkButtonTabbed(_ sender: UIButton) {
        print("okbutton")
    }
    
    func toggleCheckButton() {
        isCheck.toggle()
        var image: UIImage
        if isCheck {
            guard let checkedImage = UIImage(systemName: "circle") else { return }
            image = checkedImage
        } else {
            guard let uncheckedImage = UIImage(systemName: "circle.fill") else { return }
            image = uncheckedImage
        }
        checkButton.setImage(image, for: .normal)
        
        // 셀 선택하면 이 함수가 버튼 체크/해제 해준다.
        // 셀 아이디를 뷰모델의 함수 호출해서 보낸다.
        // 클로즈를 누르면, 뷰 모델에서 이 아이디를 모아서 close 요청하고 화면을 닫는다.
        // 서비스가 필요해 보인다.
        
    }
    
    var closeButtonAction: ((Int) -> Void)?
    var deleteButtonAction: ((Int) -> Void)?
    
    func setup(iid: Int, title: String, description: String, type: IssueResultCellViewType) {
        
        switch type {
        case .IssueListResult:
            detailViewForMulti.isHidden = true
            detailView.setup(title: title, description: description)
        case .MultiSelectedView:
            closeButton.isHidden = true
            detailView.isHidden = true
            detailViewForMulti.setup(title: title, description: description)
            detailViewForMulti.stopSwipe(to: .right)
            detailViewForMulti.stopSwipe(to: .left)
        }
        
        self.iid = iid
    }
    
    
    // MARK: Action
    
    @IBAction func closeButtonTabbed(_ sender: UIButton) {
        guard let iid = iid else { return }
        closeButtonAction?(iid)
        detailView.reset()
    }
    
    @IBAction func deleteButtonTabbed(_ sender: UIButton) {
        guard let iid = iid else { return }
        deleteButtonAction?(iid)
        detailView.reset()
    }

    
}
