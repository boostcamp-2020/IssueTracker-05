import UIKit

class LabelListCoordinator: Coordinator {
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
    
    var type: CoordinatorType { .labelList }
    
    func start() {
        showLabelListViewController()
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
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
        // 레이블 추가 화면을 present로 띄워주기 때문에 여기 로직이 들어갈 일이 없다.
    }
}
