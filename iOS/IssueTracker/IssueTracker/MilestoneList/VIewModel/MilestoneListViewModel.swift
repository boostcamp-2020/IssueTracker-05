//
//  MilestoneListViewModel.swift
//  IssueTracker
//
//  Created by 조정래 on 2020/11/05.
//  Copyright © 2020 ralph. All rights reserved.
//

import Foundation
import Alamofire

class MilestoneListViewModel {
    
    struct Status {
        var issues =  Bindable([MilestoneListModel()])
    }
    
    struct Action {
    }
    
    var status = Status()
    
    let url = "http://group05issuetracker.duckdns.org:49203/api/milestone"
    let httpHeaders:HTTPHeaders
    
    init() {
        httpHeaders
            = ["Accept": "application/json",
               "Authorization": "Bearer \(UserDefaults.standard.string(forKey: "token")!)"]
        requestMilestoneData()
    }
        
    func requestMilestoneData() {
        // 검색 결과 화면에서 돌아오면 다시 호출해 주어야 한다.
        AF.request(url, method: .get, parameters: nil, headers: httpHeaders).responseJSON { (response) in
            switch response.result {
            case .success(let result):
                do {
                    let resultData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                    let decodedData = try JSONDecoder().decode([MilestoneListModel].self, from: resultData)
                    self.status.issues.value = decodedData
                    print(self.status.issues.value)
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

