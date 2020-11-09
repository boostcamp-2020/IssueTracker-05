import UIKit

class MilestoneListCoordinator: Coordinator {
    var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorType { .milestoneList }
    
    func start() {
        let mVC: MilestoneListViewController
            = UIStoryboard(name: "MilestoneList", bundle: nil)
            .instantiateViewController(
                identifier: String(describing: MilestoneListViewController.self))
//        mVC.didSendEventClosure = { [weak self] event in
//
//        }
        navigationController.pushViewController(mVC, animated: false)
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}

