import UIKit

protocol LabelListCellViewDelegate {
    func LabelListCellView(_ labelViewCell: UICollectionViewCell,  didSelectCellView: BothSidesSwipingView)
}

class LabelListCellView: UICollectionViewCell {
    
    @IBOutlet weak var swipeView: LabelListCellSwipeView!
    @IBOutlet weak var deleteButton: UIButton!
    
    var delegate: LabelListCellViewDelegate?
    
    @IBAction func buttonTabbed(_ sender: UIButton) {
        delegate?.LabelListCellView(self, didSelectCellView: swipeView)
    }
    
    var labelTitle: String? {
        swipeView.labelTitle.title(for: .normal)
    }
    var labelDescription: String? {
        swipeView.labelDetail.text
    }
    var labelColor: String? {
        swipeView.labelTitle.backgroundColor?.toHexString()
    }
    
    func setup(title: String, description: String?, color: String) {
        swipeView.setup(title: title, description: description, color: color)
    }
    
    func reset(inPlace: Bool) {
        if inPlace {
            swipeView.reset()
        }
    }
}

class LabelListCellSwipeView: BothSidesSwipingView {
    @IBOutlet weak var labelTitle: UIButton!
    @IBOutlet weak var labelDetail: UILabel!
    
    func setup(title: String, description: String?, color: String) {
        self.stopSwipe(to: .right)
        labelTitle.setTitle(title, for: .normal)
        labelTitle.makeTagStyle(color.hexToColor())
        if let description = description {
            labelDetail.text = description
        }
    }
    
    override func reset() {
        super.reset()
        self.stopSwipe(to: .right)
    }
}
