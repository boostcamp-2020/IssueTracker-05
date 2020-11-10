
import UIKit


class MilestoneListViewCell: UICollectionViewCell {
    
    @IBOutlet var milestoneTitle: UIButton!
    @IBOutlet var dueDateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var percentageLabel: UILabel!
    @IBOutlet var openLabel: UILabel!
    @IBOutlet var closedLabel: UILabel!
    
    var issueStates: [IssueState]?
    
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
    
    func setup(with milestone: Milestone) {
        milestoneTitle.setTitle(milestone.title, for: .normal)
        dueDateLabel.text = milestone.title
        descriptionLabel.text = milestone.content ?? ""
        issueStates = milestone.issues
        
        percentageLabel.text = "\(percentageProgress)%"
        openLabel.text = "\(numberOfOpen ?? 0) open"
        closedLabel.text = "\(numberOfOpen ?? 0) closed"

    }
    
}
