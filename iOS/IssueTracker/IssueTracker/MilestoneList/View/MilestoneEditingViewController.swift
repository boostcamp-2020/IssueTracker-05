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
    
    var milestone: Milestone?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        setupUI()
    }
    
    func setupUI() {
        titleField.text = ""
        descriptionField.text = ""
        uptoDateField.text = ""
        
        if let milestone = self.milestone {
            titleField.placeholder = milestone.title
            descriptionField.placeholder = milestone.content ?? ""
            uptoDateField.placeholder = milestone.updatedAt
            return
        }
        titleField.placeholder = ""
        descriptionField.placeholder = ""
        uptoDateField.placeholder = "yyyy-mm-dd"
    }
    
    func setupDefaultValue(with milestone: Milestone) {
        self.milestone = milestone
    }
    
    @IBAction func resetButtonTabbed(_ sender: UIButton) {
        setupUI()
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func saveButtonTabbed(_ sender: UIButton) {
        saveButton.isEnabled = false
        
        guard let title = titleField.text else {
            print("title nil")
            return }
        guard let date = uptoDateField.text else {
            print("title nil")
            return }
        guard let desc = descriptionField.text else {
            print("title nil")
            return }
        
        if let milestone = self.milestone {
            // 편집 모드: 입력되어 있으면 입력 된걸로, 아니면 디폴트 값으로
            delegate?.MilestoneEditSaveButtonDidTab(
                title: title == "" ? milestone.title : title,
                description: desc == "" ? milestone.content ?? "" : desc,
                date: date == "" ? milestone.updatedAt: date,
                milestoneID: milestone.mid)
            return
        }
        
        // 추가 모드: 입려되어 있지 않으면 그냥 빈값으로
        // 빈값으로 입력할 경우 세 개 다 입력하라고 경고 메세지 띄워야 함.
        delegate?.MilestoneEditSaveButtonDidTab(
            title: title,
            description: desc,
            date: date,
            milestoneID: nil)
    }
    
    func resultOfSuccess(result: MilestoneListResultType) {
        switch result {
        case .success:
            successSaving()
        case .title:
            failSaving(errorMessage: result.rawValue)
        case .date:
            failSaving(errorMessage: result.rawValue)
        }
    }
    
    func successSaving() {
        dismiss(animated: true)
    }
    
    func failSaving(errorMessage: String) {
        alert(title: "저장 실패", message: errorMessage)
        saveButton.isEnabled = true
    }
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(
            title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction( title: "확인", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
}
