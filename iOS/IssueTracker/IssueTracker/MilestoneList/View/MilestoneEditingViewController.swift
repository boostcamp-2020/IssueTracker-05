import UIKit

protocol MilestoneEditingViewControllerDelegate {
    func MilestoneEditSaveButtonDidTab(title: String, description: String?, date: String, milestoneID: Int?) // title, desc, 색상 정보를 매개변수로 넘겨준다.
}

class MilestoneEditingViewController: UIViewController {
    
    var delegate: MilestoneEditingViewControllerDelegate?
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var uptoDateField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var milestoneID: Int? // 있으면 추가, 없으면 편집 모드
    
    var defualtTitle: String!
    var defaultDesc: String!
    var defaultUptoDate: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        setupUI()
    }
    
    func setupUI() {
        titleField.text = ""
        descriptionField.text = ""
        uptoDateField.text = defaultUptoDate
        titleField.placeholder = defualtTitle
        descriptionField.placeholder = defaultDesc
        uptoDateField.placeholder = defaultUptoDate
    }
    
    func setupDefaultValue(with milestone: Milestone) {
        milestoneID = milestone.mid
        defualtTitle = milestone.title
        defaultDesc = milestone.content ?? ""
        defaultUptoDate = milestone.updatedAt
    }
    
    @IBAction func saveButtonTabbed(_ sender: UIButton) {
        saveButton.isEnabled = false
        
        guard let title = titleField.text else { return }
        guard let date = uptoDateField.text else { return }
        guard let desc = descriptionField.text else { return }
        
        delegate?.MilestoneEditSaveButtonDidTab(
            title: title == "" ? defualtTitle : title,
            description: desc == "" ? defaultDesc : desc,
            date: date,
            milestoneID: milestoneID)
    }
    
    @IBAction func resetButtonTabbed(_ sender: UIButton) {
        setupUI()
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    
}
