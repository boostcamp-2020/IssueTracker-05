import UIKit

class IssueDetailedView: BothSidesSwipingView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var milestoneButton: UIButton!
    @IBOutlet weak var labelButton: UIButton!
    
    @IBOutlet weak var isChosenButton: UIButton?
    
    func setup(title: String, description: String, isChosen: Bool?, label: [Label]?, milestone: Milestone?) {
        titleLabel.text = title
        descriptionLabel.text = description
        
        milestoneButton.isHidden = true
        labelButton.isHidden = true
        
        if let milestone = milestone {
            configureMilestoneLable(title: milestone.title)
        }
        
        if let label = label {
            if label.count > 0 {
                labelButton.makeTagStyle()
                labelButton.backgroundColor = label.first?.color.hexToColor()
                labelButton.setTitle(label.first?.name, for: .normal)
                labelButton.isHidden = false
            }
        }
        
        guard let isChosen = isChosen else { return }
        guard let button = isChosenButton else { return }
        if isChosen == true {
            guard let checkedImage = UIImage(systemName: "circle.fill") else { return }
            button.setImage(checkedImage, for: .normal)
        } else {
            guard let uncheckedImage = UIImage(systemName: "circle") else { return }
            button.setImage(uncheckedImage, for: .normal)
        }
    }
    
    func configureMilestoneLable(title: String?) {
        milestoneButton.isHidden = false
        milestoneButton.layer.borderWidth = 1
        milestoneButton.layer.borderColor = UIColor.systemGray.cgColor
        milestoneButton.layer.cornerRadius = 5
        milestoneButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        milestoneButton.setTitle(title, for: .normal)
    }
}
