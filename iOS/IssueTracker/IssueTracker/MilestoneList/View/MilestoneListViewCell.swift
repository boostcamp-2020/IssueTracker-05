
import UIKit

class MilestoneListViewCell: UICollectionViewCell {
    
    @IBOutlet var milestoneTitle: UIButton!
    @IBOutlet var dueDateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var openLabel: UILabel!
    @IBOutlet var closedLabel: UILabel!
    @IBOutlet var percentageLabel: UILabel!
    
    func setup(title: String, open: Int, close: Int) {
        milestoneTitle.setTitle(title, for: .normal)
        openLabel.text = "\(open) open"
        closedLabel.text = "\(close) closed"
    }
    
}
