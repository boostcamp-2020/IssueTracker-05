import UIKit

protocol LabelEditingViewControllerDelegate {
    func labelEditSaveButtonDidTab(title: String, description: String, color: String, labelID: String?) // title, desc, 색상 정보를 매개변수로 넘겨준다.
}

class LabelEditingViewController: UIViewController {
    
    var delegate: LabelEditingViewControllerDelegate?
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var colorBoard: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var labelID: String? // 있으면 추가, 없으면 편집 모드
    
    var defualtTitle: String!
    var defaultDesc: String!
    var defaultColor: String! = "#FF5D5D"
    
    var randomColor: UIColor {
        UIColor(red: CGFloat.random(in: 0.0...1.0),
                green: CGFloat.random(in: 0.0...1.0),
                blue: CGFloat.random(in: 0.0...1.0),
                alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorTextField.delegate = self
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        setupUI()
    }
    
    func setupUI() {
        titleField.text = ""
        descriptionField.text = ""
        colorTextField.text = defaultColor
        titleField.placeholder = defualtTitle
        descriptionField.placeholder = defaultDesc
        colorTextField.placeholder = defaultColor
        colorBoard.backgroundColor = defaultColor.hexToColor()
    }
    
    func setupDefaultValue(title: String, desc: String?, color: String?) {
        labelID = title
        defualtTitle = title
        defaultDesc = desc ?? ""
        defaultColor = color ?? ""
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func resetRandomColor(_ sender: UIButton) {
        let randomColor = self.randomColor
        colorTextField.text = randomColor.toHexString()
        colorBoard.backgroundColor = randomColor
    }
    
    @IBAction func resetButtonTabbed(_ sender: UIButton) {
        setupUI()
    }
    
    @IBAction func saveButtonTabbed(_ sender: UIButton) {
        saveButton.isEnabled = false
        
        if let labelID = labelID {
            guard let title = titleField.text else { return }
            guard let desc = descriptionField.text else { return }
            guard let color = colorTextField.text else { return }
            
            delegate?.labelEditSaveButtonDidTab(
                title: title == "" ? defualtTitle : title,
                description: desc == "" ? defaultDesc : desc,
                color: color,
                labelID: labelID
            )
        }
        
        delegate?.labelEditSaveButtonDidTab(
            title: titleField.text ?? "",
            description: descriptionField.text ?? "",
            color: colorTextField.text ?? "",
            labelID: labelID
        )
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

extension LabelEditingViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        colorBoard.backgroundColor = textField.text?.hexToColor()
        return true
    }
}

#if DEBUG

import SwiftUI

struct LabelEditingViewController_Preview: PreviewProvider {
    static var previews: some View {
        let vc = UIStoryboard(name: "LabelList", bundle: nil)
            .instantiateViewController(identifier: String(describing: LabelEditingViewController.self))
        return vc.view.liveView
    }
}

#endif
