//
//  LoginCoordinator.swift
//  IssueTracker
//
//  Created by cho on 2020/11/07.
//  Copyright © 2020 ralph. All rights reserved.
//

import UIKit

class SignInCoordinator: Coordinator {
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType { .signIn }
        
    func start() {
        showLoginViewController()
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showLoginViewController() {
        let loginVC: SignInViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(identifier: String(describing: SignInViewController.self))

        loginVC.didSendEventClosure = { event in
            switch event {
            case .signin:
                self.finish()
            case .signup:
                self.showSignUpViewController()
            }
        }
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    func showSignUpViewController() {
        let signCoordinator = SignUpCoordinator(navigationController)
        signCoordinator.finishDelegate = self
        signCoordinator.start()
    }
    
    
}

extension SignInCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        navigationController.popViewController(animated: true)
    }
}
