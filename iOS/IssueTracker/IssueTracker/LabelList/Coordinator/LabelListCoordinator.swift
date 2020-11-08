import UIKit

class LabelListCoordinator: Coordinator {
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
    
    var type: CoordinatorType { .issueList }
    
    func start() {
        showLabelListViewController()
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        //self.navigationController.navigationBar.isHidden = false
    }
    
    func showLabelListViewController() {
        let labelVC: LabelListViewController
            = UIStoryboard(name: "LabelList", bundle: nil)
            .instantiateViewController(identifier: String(describing: LabelListViewController.self))
        
        labelVC.didSendEventClosure = { [weak self] event in
            switch event {
            case .finished:
                self?.finish()
            }
        }
        navigationController.pushViewController(labelVC, animated: true)
    }
}

extension LabelListCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        
        // 여기서 레이블 추가 편집 화면 해제 처리 해준다.
        
    }
}
