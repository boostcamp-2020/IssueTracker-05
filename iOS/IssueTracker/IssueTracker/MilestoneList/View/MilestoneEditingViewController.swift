import UIKit

protocol MilestoneEditingViewControllerDelegate {
    func MilestoneEditSaveButtonDidTab(title: String, description: String, color: String, labelID: String?) // title, desc, 색상 정보를 매개변수로 넘겨준다.
}

class MilestoneEditingViewController: UIViewController {
    
    var delegate: MilestoneEditingViewControllerDelegate?
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var labelID: String? // 있으면 추가, 없으면 편집 모드
    
    var defualtTitle: String!
    var defaultDesc: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        setupUI()
    }
    
    func setupUI() {
        
    }
   
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func resetButtonTabbed(_ sender: UIButton) {
        setupUI()
    }
    
    @IBAction func saveButtonTabbed(_ sender: UIButton) {
        saveButton.isEnabled = false
        
        
    }
    
    func resultOfSuccess(result: LabelListResultType) {
        switch result {
        case .success:
            successSaving()
        case .fail:
            guard let message = result.errorDescription else { return }
            failSaving(errorMessage: message)
        }
    }
    
    func successSaving() {
        dismiss(animated: true)
        // 저장 성공 alert를 할지 고민
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
