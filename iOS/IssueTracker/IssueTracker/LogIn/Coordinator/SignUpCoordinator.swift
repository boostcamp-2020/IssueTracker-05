//
//  LoginCoordinator.swift
//  IssueTracker
//
//  Created by cho on 2020/11/07.
//  Copyright © 2020 ralph. All rights reserved.
//

import UIKit

class SignUpCoordinator: Coordinator {
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType { .signUp }
        
    func start() {
        showSignUpViewController()
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showSignUpViewController() {
        let signupVC: SignUpViewController = UIStoryboard(name: "SignUp", bundle: nil).instantiateViewController(identifier: String(describing: SignUpViewController.self))
        signupVC.didSendEventClosure = { [weak self] event in
            self?.finish()
        }
        navigationController.pushViewController(signupVC, animated: true)
    }
    
}
