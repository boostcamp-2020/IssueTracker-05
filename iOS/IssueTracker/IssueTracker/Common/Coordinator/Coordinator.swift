//
//  Coordinator.swift
//  IssueTracker
//
//  Created by cho on 2020/11/07.
//  Copyright © 2020 ralph. All rights reserved.
//

import UIKit

// MARK: - Coordinator
protocol Coordinator: class {
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    var type: CoordinatorType { get }
    func start()
    func finish()
    
    init(_ navigationController: UINavigationController)
}

extension Coordinator {
    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}


protocol CoordinatorFinishDelegate: class {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}

enum CoordinatorType {
    case jrm, tab, signIn, signUp, issueList, labelList, milestoneList
}
