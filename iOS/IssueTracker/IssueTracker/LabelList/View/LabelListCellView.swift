import UIKit

class LabelListCellView: UICollectionViewCell {
    
    @IBOutlet weak var labelTitle: UIButton!
    @IBOutlet weak var labelDetail: UILabel!
    var labelColor: String?
    
    func setup(title: String, description: String?, color: String) { 
        labelTitle.setTitle(title, for: .normal)
        labelTitle.makeTagStyle(color.hexToColor())
        if let description = description {
            labelDetail.text = description
        }
        labelColor = color
    }
    
}
