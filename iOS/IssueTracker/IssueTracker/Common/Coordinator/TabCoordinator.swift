
import UIKit

enum TabBarPage {
    case issue
    case label
    case milestone
    
    init?(index: Int) {
        switch index {
        case 0: self = .issue
        case 1: self = .label
        case 2: self = .milestone
        default: return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .issue:  return "이슈"
        case .label: return "레이블"
        case .milestone: return "마일스톤"
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .issue:  return 0
        case .label: return 1
        case .milestone: return 2
        }
    }
    
    // Add tab icon value
    func pageIconImage() -> UIImage? {
        UIImage(systemName: "\(self.pageOrderNumber() + 1).circle.fill")
    }
    
    // Add tab icon selected / deselected color
    
    // etc
}


protocol TabCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get set }
    func selectPage(_ page: TabBarPage)
    func setSelectedIndex(_ index: Int)
    func currentPage() -> TabBarPage?
}

class TabCoordinator: NSObject, Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    var type: CoordinatorType { .tab }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }
    
    func start() {
        let pages: [TabBarPage] = [.milestone, .label, .issue]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        prepareTabBarController(withTabControllers: controllers)
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        
        tabBarController.delegate = self
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.issue.pageOrderNumber() // 첫 화면 설정
        tabBarController.tabBar.isTranslucent = false
        
        navigationController.viewControllers = [tabBarController]
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)
        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: page.pageIconImage(),
                                                     tag: page.pageOrderNumber())
        
        switch page {
        // If needed: Each tab bar flow can have it's own Coordinator.
        case .issue:
            let issueListMainViewController: IssueListMainViewController =
                UIStoryboard(name: "IssueList", bundle: nil).instantiateViewController(
                    identifier: String(describing: IssueListMainViewController.self))
            
            issueListMainViewController.didSendEventClosure = { [weak self] event in
                switch event {
                case .finished :
                    self?.finish()
                }
            }
            
            navController.pushViewController(issueListMainViewController, animated: true)
        case .label:
            let labelListViewController: LabelListViewController = UIStoryboard(name: "LabelList", bundle: nil).instantiateViewController(identifier: String(describing: LabelListViewController.self))
            labelListViewController.didSendEventClosure
                = { [weak self] event in
                    switch event {
                    case .finished:
                        self?.finish()
                    }
                }
            navController.pushViewController(labelListViewController, animated: true)
        case .milestone:
            
            let milestoneListViewController: MilestoneListViewController = UIStoryboard(name: "MilestoneList", bundle: nil).instantiateViewController(identifier: String(describing: MilestoneListViewController.self))
            milestoneListViewController.didSendEventClosure
                = { [weak self] event in
                    switch event {
                    case .finished:
                        self?.finish()
                    }
                }
            navController.pushViewController(milestoneListViewController, animated: true)
        }
        
        return navController
    }
    
    func currentPage() -> TabBarPage? { TabBarPage.init(index: tabBarController.selectedIndex) }
    
    func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        guard let page = TabBarPage.init(index: index) else { return }
        
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}

// MARK: - UITabBarControllerDelegate
extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        print("viewController \(1)")
    }
}
