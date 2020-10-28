
import UIKit

class IssueListMainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let resultViewController = storyboard!.instantiateViewController(identifier: "IssueResultViewController")

        present(resultViewController, animated: true)
        
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
