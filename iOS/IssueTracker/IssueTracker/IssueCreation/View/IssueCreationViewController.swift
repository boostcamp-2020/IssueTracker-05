import UIKit
import MarkdownView

class IssueCreationViewController: UIViewController {
        
    @IBOutlet weak var markdownSegmentedControl: UISegmentedControl!
    @IBOutlet weak var uploadButton: UIButton!
    
    @IBOutlet weak var titleTextView: UITextField!
    
    @IBOutlet weak var IssueNumberLabel: UILabel!
    
    @IBOutlet weak var markdownTextView: UITextView! {
        didSet {
            markdownTextView.delegate = self
        }
    }
    
    private let placeholderMessage = "코멘트는 여기에 작성하세요"
    
    var refresh: (()->Void)?
    
    
    var viewModel = IssueCreationViewModel()
    
    override func viewDidLoad() {
        configure()
        textViewSetupView()
    }
        
    func configure() {
        guard let number = viewModel.status.id else { return }
        IssueNumberLabel.text = "# \(number)"
        titleTextView.text = viewModel.status.title
        markdownTextView.text = viewModel.status.content
        isModalInPresentation = true
    }
    
    func removeMarkdownView() {
        view.subviews.forEach { view in
            if view is MarkdownView {
                view.removeFromSuperview()
            }
        }
        self.markdownTextView.isHidden = false
    }
    
    func renderMarkdownView() {
        let mdView = MarkdownView()
        view.addSubview(mdView)
        mdView.translatesAutoresizingMaskIntoConstraints = false
        mdView.topAnchor.constraint(equalTo: markdownSegmentedControl.bottomAnchor).isActive = true
        mdView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mdView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        mdView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        self.markdownTextView.isHidden = true
        DispatchQueue.main.async {
            if self.markdownTextView.text != self.placeholderMessage {
                mdView.load(markdown: self.markdownTextView.text)
            }
        }
    }
    
    @IBAction func cancelButtonDidTabbed(_ sender: Any) {
        self.dismiss(animated: true)
    }

    @IBAction func uploadButtonTabbed(_ sender: Any) {
        
        if let id = self.viewModel.status.id {
            self.viewModel.service.requestEditIssue(issueId: id, title: self.titleTextView.text! , content: markdownTextView.text)
        } else {
            self.viewModel.service.requestAddIssue(title: self.titleTextView.text!, content: markdownTextView.text)
        }
        
        self.dismiss(animated: true) { [weak self] in
            self?.refresh?()
        }
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            removeMarkdownView()
        case 1:
            renderMarkdownView()
        default:
            break
        }
    }
    
}

extension IssueCreationViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textViewSetupView()
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textViewSetupView()
        }
    }
    
    func textViewSetupView() {        
        if markdownTextView.text == placeholderMessage {
            markdownTextView.text = ""
            markdownTextView.textColor = UIColor.black
        } else if markdownTextView.text.isEmpty {
            markdownTextView.text = placeholderMessage
            markdownTextView.textColor = UIColor.lightGray
        }
    }
    
}
