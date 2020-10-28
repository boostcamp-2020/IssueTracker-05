
import UIKit

class IssueListMainViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
}

#if DEBUG

import SwiftUI

struct IssueListMainViewController_Preview: PreviewProvider {
    static var previews: some View {
        let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: String(describing: IssueListMainViewController.self))
        return vc.view.liveView
    }
}

#endif
