
import UIKit

class IssueCommentCellView: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var conentLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    func setup(title: String, user: String, content: String) {
        titleLabel.text = title
        userLabel.text = user
        conentLabel.text = content
    }
}
