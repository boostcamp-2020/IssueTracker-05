import UIKit

class LabelListCellView: UICollectionViewCell {
    
    
    
    @IBOutlet weak var labelTitle: UIButton!
    @IBOutlet weak var labelDetail: UILabel!
    
    func setup(title: String, description: String?) { // 색도 받아와야 한다.
        labelTitle.setTitle(title, for: .disabled)
        if let description = description {
            labelDetail.text = description
        }
    }
    
}
