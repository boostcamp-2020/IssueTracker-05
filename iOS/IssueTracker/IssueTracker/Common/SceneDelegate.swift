
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if nil == Bundle.main.url(forResource: "dummyToken", withExtension: "txt") {
            
            let issueListMainViewController = UIStoryboard(name: "IssueList", bundle: nil).instantiateViewController(identifier: String(describing: IssueListMainViewController.self))
            
            let navController = UINavigationController(rootViewController: issueListMainViewController)
            navController.navigationBar.topItem?.title = "이슈"
            navController.navigationBar.prefersLargeTitles = true
            navController.tabBarItem
                = UITabBarItem(title: "이슈", image: nil, tag: 0)
            
            let labelListViewController = UIStoryboard(name: "LabelList", bundle: nil).instantiateViewController(identifier: String(describing: LabelListViewController.self))
            labelListViewController.tabBarItem
                = UITabBarItem(title: "레이블", image: nil, tag: 0)
            
            let milestoneListViewController = UIStoryboard(name: "MilestoneList", bundle: nil).instantiateViewController(identifier: String(describing: MilestoneListViewController.self))
            milestoneListViewController.tabBarItem
                = UITabBarItem(title: "마일스톤", image: nil, tag: 0)
            
            let tabBarController = UITabBarController()
            tabBarController.tabBar.tintColor = UIColor.black
            tabBarController.viewControllers
                = [navController, labelListViewController, milestoneListViewController]
            
            
            
            window?.rootViewController = tabBarController
            
        } else {
            window?.rootViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(identifier: "LoginNavigationVC")
        }

    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            if url.absoluteString.starts(with: "ralp://") {
                if let code = url.absoluteString.split(separator: "=").last.map({ String($0) }) {
                    LoginManager.shared.requestAccessToken(with: code)
                }
            }
//            print(url)
        }
    }
}

