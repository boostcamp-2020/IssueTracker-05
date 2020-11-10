//
//  IssueCreationViewModel.swift
//  IssueTracker
//
//  Created by cho on 2020/11/10.
//  Copyright © 2020 ralph. All rights reserved.
//

import Foundation

class IssueCreationViewModel {
    
    lazy var service = IssueCreationService(viewModel: self)
    
    struct Status {
        var id: Int?
    }
    
    struct Action {
        var didUploadTabbed: (Int?, String, String) -> Void
    }
    
    var status = Status()
    
    lazy var action = Action(
        
        didUploadTabbed: { [weak self] (id, title, content) in
            guard let weakSelf = self else { return }
            if let id = id {
                self?.service.requestEditIssue(issueId: id, title: title, content: content)
            } else {
                self?.service.requestAddIssue(title: title, content: content)
            }
        })

    
}
