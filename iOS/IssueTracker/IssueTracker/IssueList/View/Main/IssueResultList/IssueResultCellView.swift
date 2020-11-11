import UIKit

enum IssueResultCellViewType {
    case IssueListResult
    case MultiSelectedView
}


class IssueResultCellView: UICollectionViewCell {
    
    var iid: Int?
    
    @IBOutlet weak var detailView: IssueDetailedView!
    @IBOutlet weak var detailViewForMulti: IssueDetailedView!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    @IBAction func checkButtonTabbed(_ sender: UIButton) {
        print("okbutton")
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
