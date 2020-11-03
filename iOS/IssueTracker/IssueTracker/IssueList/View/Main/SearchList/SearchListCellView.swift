import UIKit

class SearchListCellView: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(title: String) {
        titleLabel.text = title
    }
    
}
