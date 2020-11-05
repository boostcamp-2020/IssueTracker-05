import UIKit

class IssueResultCellView: UICollectionViewCell {
    
    @IBOutlet weak var detailView: IssueDetailedView!
    var iid: Int?

    var closeButtonAction: ((Int) -> Void)?
    var deleteButtonAction: ((Int) -> Void)?
    
    func setup(iid: Int, title: String, description: String) {
        detailView.setup(title: title, description: description)
        self.iid = iid
    }
    
    @IBAction func closeButtonTabbed(_ sender: UIButton) {
        guard let iid = iid else { return }
        closeButtonAction?(iid)
    }
    
    @IBAction func deleteButtonTabbed(_ sender: UIButton) {
        guard let iid = iid else { return }
        deleteButtonAction?(iid)
    }

    
}
