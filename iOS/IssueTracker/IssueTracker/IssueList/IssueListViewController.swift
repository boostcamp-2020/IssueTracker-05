
import UIKit

class IssueListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
}

#if DEBUG

import SwiftUI

struct Preview: PreviewProvider {
    static var previews: some View {
        let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "IssueListViewController")
        return vc.view.liveView
    }
}

#endif
