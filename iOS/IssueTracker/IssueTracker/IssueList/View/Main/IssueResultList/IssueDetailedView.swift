import UIKit

class IssueDetailedView: BothSidesSwipingView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var milestoneLabel: UIButton!
    @IBOutlet weak var labelLabel: UILabel!
    
    @IBOutlet weak var isChosenButton: UIButton?
    
    func setup(title: String, description: String, isChosen: Bool?) {
        titleLabel.text = title
        descriptionLabel.text = description
        configureMilestoneLable()
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
    
    func configureMilestoneLable() {
        milestoneLabel.layer.borderWidth = 1
        milestoneLabel.layer.borderColor = UIColor.systemGray.cgColor
        milestoneLabel.layer.cornerRadius = 5
        milestoneLabel.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
