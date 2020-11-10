
import UIKit


class MilestoneListViewCell: UICollectionViewCell {
    
    @IBOutlet var milestoneTitle: UIButton!
    @IBOutlet var dueDateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var percentageLabel: UILabel!
    @IBOutlet var openLabel: UILabel!
    @IBOutlet var closedLabel: UILabel!
    
    var issueStates: [IssueState]?
    
    
    func setup(with milestone: Milestone) {
        milestoneTitle.setTitle(milestone.title, for: .normal)
        milestoneTitle.contentEdgeInsets.top = 2
        milestoneTitle.contentEdgeInsets.bottom = 2
        milestoneTitle.contentEdgeInsets.left = 4
        milestoneTitle.contentEdgeInsets.right = 4
        dueDateLabel.text = milestone.updatedAt
        // TODO: 날짜 형식 바꿔주기
        descriptionLabel.text = milestone.content ?? ""
        issueStates = milestone.issues
        percentageLabel.text = "\(percentageProgress)%"
        openLabel.text = "\(numberOfOpen ?? 0) open"
        closedLabel.text = "\(numberOfOpen ?? 0) closed"
    }
    
    var numberOfOpen: Int? {
        guard let issueStates = self.issueStates else { return nil }
        return issueStates.filter { $0.isOpen == true }.count
    }
    
    var numberOfClosed: Int? {
        guard let issueStates = self.issueStates else { return nil }
        return issueStates.filter { $0.isOpen == false }.count
    }
    
    var percentageProgress: Int {
        guard let open = numberOfOpen else { return 0 }
        guard let close = numberOfClosed else { return 0 }
        if open + close == 0 { return 0 }
        return Int(Float(open) / Float(open + close))
    }
    
}
