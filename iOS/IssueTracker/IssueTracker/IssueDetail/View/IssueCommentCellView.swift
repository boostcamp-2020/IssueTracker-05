
import UIKit

class IssueCommentCellView: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    func setup(user: String, content: String) {
        userLabel.text = user
        contentLabel.text = content
    }
}
