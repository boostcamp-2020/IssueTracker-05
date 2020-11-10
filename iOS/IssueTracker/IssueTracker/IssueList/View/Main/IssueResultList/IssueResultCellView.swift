import UIKit

class IssueResultCellView: UICollectionViewCell {
    
    var iid: Int?
    
    @IBOutlet weak var detailView: IssueDetailedView!
    
    var closeButtonAction: ((Int) -> Void)?
    var deleteButtonAction: ((Int) -> Void)?
    
    func setup(iid: Int, title: String, description: String) {
        detailView.setup(title: title, description: description)
        self.iid = iid
    }
    
    
    // MARK: Action
    
    @IBAction func closeButtonTabbed(_ sender: UIButton) {
        guard let iid = iid else { return }
        closeButtonAction?(iid)
        detailView.reset()
    }
    
    @IBAction func deleteButtonTabbed(_ sender: UIButton) {
        guard let iid = iid else { return }
        deleteButtonAction?(iid)
        detailView.reset()
    }

    
}
