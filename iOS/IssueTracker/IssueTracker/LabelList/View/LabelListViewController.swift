import UIKit

class LabelListViewController: UIViewController {
  
    var didSendEventClosure: ((LabelListViewController.Event)-> Void)?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
}

extension LabelListViewController {
    enum Event {
        case finished
    }
}

