import UIKit

protocol MilestoneEditingViewControllerDelegate {
    func MilestoneEditSaveButtonDidTab(title: String, description: String?, date: String, milestoneID: Int?) // title, desc, 색상 정보를 매개변수로 넘겨준다.
}

class MilestoneEditingViewController: UIViewController {
    
    var delegate: MilestoneEditingViewControllerDelegate?
    
    @IBOutlet weak var popupViewVerticalConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var uptoDateField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var milestone: Milestone?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        addKeyboardNotification()
        setupUI()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setupUI() {
        titleField.text = ""
        descriptionField.text = ""
        uptoDateField.text = ""
        
        if let milestone = self.milestone {
            titleField.text = milestone.title
            descriptionField.text = milestone.content ?? ""
            uptoDateField.placeholder = milestone.dueDate
            return
        }
        titleField.text = ""
        descriptionField.text = ""
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
            delegate?.MilestoneEditSaveButtonDidTab(
                title: title == "" ? milestone.title : title,
                description: desc == "" ? milestone.content ?? "" : desc,
                date: date == "" ? milestone.dueDate ?? "0000-00-00" : date,
                milestoneID: milestone.mid)
            return
        }
        
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

extension MilestoneEditingViewController {
    
    private func addKeyboardNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keybaordRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keybaordRectangle.height
            popupViewVerticalConstraint.constant -= keyboardHeight / 2
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keybaordRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keybaordRectangle.height
            popupViewVerticalConstraint.constant += keyboardHeight / 2
        }
    }
    
}
