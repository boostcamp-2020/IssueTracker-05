import UIKit


class MilestoneListViewController: UIViewController {
    
    var didSendEventClosure: ((MilestoneListViewController.Event)-> Void)?
    @IBOutlet weak var collectionView: UICollectionView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension MilestoneListViewController {
    enum Event {
        case finished
    }
}
