import UIKit

class IssueResultCellView: UICollectionViewCell {
    
    @IBOutlet weak var detailView: IssueDetailedView!
    
    func setup(title: String, description: String) {
        detailView.setup(title: title, description: description)
    }
    
}
