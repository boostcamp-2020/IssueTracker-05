import UIKit

class IssueListCoordinator: Coordinator {
    
    var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    var type: CoordinatorType { .issueList }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let newVC: IssueListMainViewController
            = UIStoryboard(name: "IssueList", bundle: nil)
            .instantiateViewController(
                identifier: String(describing: IssueListMainViewController.self))
        newVC.didSendEventClosure = { [weak self] event in
            switch event {
            case .finished :
                self?.finish()
            }
        }
        navigationController.pushViewController(newVC, animated: true)
    }
    
}

extension IssueListCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        // 여기서 이슈 디테일 뷰 정리
    }
}
