import UIKit

class IssueDetailedView: BothSidesSwipingView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var milestoneLabel: UIButton!
    @IBOutlet weak var labelLabel: UILabel!
    
    func setup(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
        configureMilestoneLable()
    }
    
    func configureMilestoneLable() {
        milestoneLabel.layer.borderWidth = 1
        milestoneLabel.layer.borderColor = UIColor.systemGray.cgColor
        milestoneLabel.layer.cornerRadius = 5
        milestoneLabel.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
