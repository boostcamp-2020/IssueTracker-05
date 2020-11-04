import UIKit

class IssueResultCellView: UICollectionViewCell {
    
    @IBOutlet weak var detailView: IssueDetailedView!
    var iid: Int?

    var closeButtonAction: (() -> Void)?
    var deleteButtonAction: (() -> Void)?
    
    func setup(iid: Int, title: String, description: String) {
        detailView.setup(title: title, description: description)
        self.iid = iid
    }
    
    @IBAction func closeButtonTabbed(_ sender: UIButton) {
        closeButtonAction?()
    }
    
    @IBAction func deleteButtonTabbed(_ sender: UIButton) {
        deleteButtonAction?()
    }

    
}
