
import UIKit

class IssueCommentCellView: UICollectionViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    func setup(user: String, content: String, time: String) {
        userLabel.text = user
        contentLabel.text = content
        if let dateString = time.timeFormatToDate()?.lastTimeToString() {
            timeLabel.text = dateString
        }
    }
    
}

