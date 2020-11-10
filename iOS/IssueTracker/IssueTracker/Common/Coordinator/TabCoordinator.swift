
import UIKit


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
        // 각각 뷰컨트롤러를 네비게이션 바에 넣어준다.
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        
        tabBarController.delegate = self
        
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.issue.pageOrderNumber() // 첫 화면 설정
        tabBarController.tabBar.isTranslucent = false
        
        navigationController.viewControllers = [tabBarController]
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let newNavController = UINavigationController()
        newNavController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: page.pageIconImage(),
                                                     tag: page.pageOrderNumber())
        
        switch page {
        case .issue:
            let issueListCoordinator = IssueListCoordinator(newNavController)
            issueListCoordinator.start()
            childCoordinators.append(issueListCoordinator)
        case .label:
            let labelCoordinator = LabelListCoordinator(newNavController)
            //labelCoordinator.finishDelegate = self
            labelCoordinator.start()
            childCoordinators.append(labelCoordinator)
        case .milestone:
            let milestoneCoordinator = MilestoneListCoordinator(newNavController)
            milestoneCoordinator.start()
            childCoordinators.append(milestoneCoordinator)
        }
        
        // 네비게이션에 vc가 들어간 후 설정해주어야 한다.
        newNavController.navigationBar.prefersLargeTitles = true
        newNavController.navigationItem.largeTitleDisplayMode = .never
        newNavController.navigationBar.topItem?.title = page.pageTitleValue()
        
        return newNavController
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

        // 탭바에서 이동할 때 뭔가 화면 전환 로직이 필요하면 여기서 추가한다.
        
    }
}

extension TabCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        // tabBar는 지워지면서 가지고 있는 vc를 삭제해 준다. 그래서 각 vc의 삭제 로직이 필요 없다.
        // 이 함수가 호출되는 경우는 tabBar에 들어가는 VC를 하나만 교체 또는 삭제 하는 경우다.
        // 우리 프로젝트에는 그런 경우가 없다.
    }
}


// MARK: TabBarPage Enum

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
