//
//  Coordinator.swift
//  IssueTracker
//
//  Created by cho on 2020/11/07.
//  Copyright © 2020 ralph. All rights reserved.
//

import UIKit

class SceneCoordinator: Coordinator {

    var finishDelegate: CoordinatorFinishDelegate? = nil
    
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
    
    var type: CoordinatorType { .jrm }
    
    var isToken: String? {
        UserDefaults.standard.string(forKey: "token")
    }
    
    
    func start() {
        
        if let _ = isToken {
            showLoginFlow()
        } else {
            showMainFlow()
        }
        
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    
    func showLoginFlow() {
        print("1")
    }
    
    func showMainFlow() {
        print("2")
    }
    
}

extension SceneCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0.type != childCoordinator.type }
        
        switch childCoordinator.type {
        case .tab:
            navigationController.viewControllers.removeAll()
            showLoginFlow()
        case .jrm:
            navigationController.viewControllers.removeAll()
            showMainFlow()
        default: break
            
        }
        
    }
}




