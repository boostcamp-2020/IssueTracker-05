
import UIKit

class IssueDetailViewController: UIViewController {
    
    var viewModel: IssueDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

#if DEBUG

import SwiftUI

struct IssueDetailViewController_Preview: PreviewProvider {
    static var previews: some View {
        let vc = UIStoryboard(name: "IssueDetail", bundle: nil)
            .instantiateViewController(identifier: String(describing: IssueDetailViewController.self))
        return vc.view.liveView
    }
}

#endif
