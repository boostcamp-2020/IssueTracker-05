import UIKit

protocol LabelEditingViewControllerDelegate {
    func labelEditSaveButtonDidTabbed() // title, desc, 색상 정보를 매개변수로 넘겨준다.
}

class LabelEditingViewController: UIViewController {
    
    var delegate: LabelEditingViewControllerDelegate?
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    //@IBOutlet weak var 색상
    
    @IBAction func resetButtonTabbed(_ sender: UIButton) {
        titleField.text = ""
        descriptionField.text = ""
    }
    
    @IBAction func saveButtonTabbed(_ sender: UIButton) {
        delegate?.labelEditSaveButtonDidTabbed() 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
    }
    
    
}
