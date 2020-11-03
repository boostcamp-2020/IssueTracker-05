import UIKit

class IssueResultCellView: UICollectionViewCell {
    
    @IBOutlet weak var detailView: IssueDetailedView!
    
    var closeButtonAction: (() -> Void)?
    var deleteButtonAction: (() -> Void)?
    
    func setup(title: String, description: String) {
        detailView.setup(title: title, description: description)
    }
    
    @IBAction func closeButtonTabbed(_ sender: UIButton) {
        closeButtonAction?()
    }
    
    @IBAction func deleteButtonTabbed(_ sender: UIButton) {
        deleteButtonAction?()
    }

    
}
