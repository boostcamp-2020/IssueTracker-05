
import UIKit

class IssueListMainViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let searchListViewController = storyboard!.instantiateViewController(identifier: "SearchListViewController")
//
//        let nav = storyboard!.instantiateViewController(identifier: "issueListNavigation")
//        as UINavigationController
//
//        nav.pushViewController(searchListViewController, animated: false)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let searchListViewController = storyboard!.instantiateViewController(identifier: "SearchListViewController")
        
        let nav = storyboard!.instantiateViewController(identifier: "issueListNavigation")
        as UINavigationController
        
        nav.pushViewController(searchListViewController, animated: false)
    }
    
    
}

#if DEBUG

import SwiftUI

struct Preview: PreviewProvider {
    static var previews: some View {
        let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "IssueListMainViewController")
        return vc.view.liveView
    }
}

#endif
