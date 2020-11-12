//
//  IssueCreationService.swift
//  IssueTracker
//
//  Created by cho on 2020/11/10.
//  Copyright © 2020 ralph. All rights reserved.
//

import Alamofire

class IssueCreationService {
    let url = "http://group05issuetracker.duckdns.org:49203"
    
    let headers: HTTPHeaders
    
    unowned let viewModel: IssueCreationViewModel
    
    init(viewModel: IssueCreationViewModel) {
        self.viewModel = viewModel
        headers
            = ["Accept": "application/json",
               "Authorization": "Bearer \(UserDefaults.standard.string(forKey: "token")!)"]
    }

    func requestAddIssue(title: String, content: String) {
        
        let parameters = ["title" : title,
                          "content" : content,
                          "uid" : UserDefaults.standard.string(forKey: "uid")]
        
        AF.request(url + "/api/issue",
                   method: .post,
                   parameters: parameters,
                   headers: headers)
            .responseData { [weak self] response in
                guard self != nil else { return }
                switch response.result {
                case .success(let data):
                    print(data)
                case .failure(let error):
                    print("error",error)
                }
            }
    }
    
    func requestEditIssue(issueId: Int, title: String, content: String) {

        let parameters = ["title" : title,
                          "content" : content,
                          "uid" : UserDefaults.standard.string(forKey: "uid")]
        
        AF.request(url + "/api/issue/\(issueId)",
                   method: .patch,
                   parameters: parameters,
                   headers: headers)
            .responseData { [weak self] response in
                guard self != nil else { return }
                switch response.result {
                case .success(let data):
                    print(data)
                case .failure(let error):
                    print("error",error)
                }
            }
        
    }
    
}
