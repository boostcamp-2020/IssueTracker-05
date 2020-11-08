import UIKit

class LabelListViewController: UIViewController {
  
    var didSendEventClosure: ((LabelListViewController.Event)-> Void)?
    
}

extension LabelListViewController {
    enum Event {
        case finished
    }
}

