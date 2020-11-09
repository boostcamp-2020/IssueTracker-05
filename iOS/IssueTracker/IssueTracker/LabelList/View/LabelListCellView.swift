import UIKit

class LabelListCellView: UICollectionViewCell {
    
    @IBOutlet weak var labelTitle: UIButton!
    @IBOutlet weak var labelDetail: UILabel!
    var labelColor: String?
    
    func setup(title: String, description: String?, color: String) { // 색도 받아와야 한다.
        labelTitle.setTitle(title, for: .normal)
        labelTitle.makeTagStyle(color.hexToColor())
        if let description = description {
            labelDetail.text = description
        }
        //labelTitle.backgroundColor =
        labelColor = color
    }
    
}
