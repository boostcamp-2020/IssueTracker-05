import UIKit

enum IssueResultCellViewType {
    case IssueListResult
    case MultiSelectedView
}

class IssueResultCellView: UICollectionViewCell {
    
    override func prepareForReuse() {
        print("reuse")
    }
    
    
    var iid: Int?
    var isChosen: Bool? = false
    
    @IBOutlet weak var detailView: IssueDetailedView!
    @IBOutlet weak var detailViewForMulti: IssueDetailedView!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    var closeButtonAction: ((Int) -> Void)?
    var deleteButtonAction: ((Int) -> Void)?
    
    func setup(iid: Int, title: String, description: String, type: IssueResultCellViewType, isChosen: Bool?) {
        
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
        
        guard let newIsSelected = isChosen else { return }
        guard let oldIsSelected = self.isChosen else { return }
        
        if newIsSelected != oldIsSelected {
            if newIsSelected == true {
                guard let checkedImage = UIImage(systemName: "circle.fill") else { return }
                checkButton.setImage(checkedImage, for: .normal)
            } else {
                guard let uncheckedImage = UIImage(systemName: "circle") else { return }
                checkButton.setImage(uncheckedImage, for: .normal)
            }
        }
        self.isChosen = newIsSelected
        
    }
//    
//    func drawCheckButton() {
//        // TODO:  selected 방식으로 바꾸기
//        var image: UIImage
//        if isCheck {
//            
//        } else {
//            
//        }
//        checkButton.setImage(image, for: .normal)
//    }
//    
    
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
