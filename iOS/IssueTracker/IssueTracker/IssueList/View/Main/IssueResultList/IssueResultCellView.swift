import UIKit

enum IssueResultCellViewType {
    case IssueListResult
    case MultiSelectedView
}

class IssueResultCellView: UICollectionViewCell {
        
    var iid: Int?
    var isChosen: Bool? = false
    
    @IBOutlet weak var detailView: IssueDetailedView!
    @IBOutlet weak var detailViewForMulti: IssueDetailedView!
    @IBOutlet weak var closeButton: UIButton!
    
    var closeButtonAction: ((Int) -> Void)?
    var deleteButtonAction: ((Int) -> Void)?
    
 
    var title = ""
    var desc = ""
    var type = IssueResultCellViewType.IssueListResult
    
    var label = [Label]()
    var mileston: Milestone?
    
    func setup(iid: Int, title: String, description: String, type: IssueResultCellViewType, isChosen: Bool?, label: [Label], milestone: Milestone?) {
        
        self.title = title
        self.desc = description
        self.type = type
        self.isChosen = isChosen
        self.label = label
        self.mileston = milestone
        
        switch type {
        case .IssueListResult:
            detailViewForMulti.isHidden = true
            detailView.setup(title: title, description: description, isChosen: isChosen, label: label, milestone: milestone)
        case .MultiSelectedView:
            closeButton.isHidden = true
            detailView.isHidden = true
            detailViewForMulti.setup(title: title, description: description, isChosen: isChosen, label: nil, milestone: nil)
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
