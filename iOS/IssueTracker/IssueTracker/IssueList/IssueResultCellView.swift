import UIKit

class IssueResultCellView: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
}
