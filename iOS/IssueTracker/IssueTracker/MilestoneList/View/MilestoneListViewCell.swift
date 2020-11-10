
import UIKit


class MilestoneListViewCell: UICollectionViewCell {

    var milestone: Milestone!
    
    @IBOutlet var milestoneTitle: UIButton!
    @IBOutlet var dueDateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var percentageLabel: UILabel!
    @IBOutlet var openLabel: UILabel!
    @IBOutlet var closedLabel: UILabel!
    
    var issueStates: [IssueState]?
    
    func date(with date: String) -> String {
        date.components(separatedBy: "T")[0]
    }
    
    func setup(with milestone: Milestone) {
        self.milestone = milestone
        milestoneTitle.setTitle(milestone.title, for: .normal)
        dueDateLabel.text = milestone.updatedAt
        descriptionLabel.text = milestone.content ?? ""
        issueStates = milestone.issues
        percentageLabel.text = "\(percentageProgress)%"
        openLabel.text = "\(numberOfOpen ?? 0) open"
        closedLabel.text = "\(numberOfOpen ?? 0) closed"
        setupMilestoneTitleLabel()
        
        self.milestone.updatedAt = date(with: self.milestone.updatedAt)
        print(self.milestone.updatedAt)
    }
    
    func setupMilestoneTitleLabel() {
        milestoneTitle.contentEdgeInsets.top = 2
        milestoneTitle.contentEdgeInsets.bottom = 2
        milestoneTitle.contentEdgeInsets.left = 4
        milestoneTitle.contentEdgeInsets.right = 4
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
