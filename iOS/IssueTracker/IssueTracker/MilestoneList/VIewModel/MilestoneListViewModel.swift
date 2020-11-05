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
    let httpHeaders:HTTPHeaders = ["Accept": "application/json","Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjExLCJ1c2VySWQiOiJhYWExMTEiLCJwYXNzd29yZCI6IiQyYiQxMiRFQmIxMDBuckJCRTZZSDhXSWNvam5PS3d5YlYzSUQ1VHE4U2x6RWxnRWdXUm0xRU9TOVQzMiIsIm5pY2tuYW1lIjoiYWFhMTExIiwiT0F1dGgiOmZhbHNlLCJyZXNvdXJjZVNlcnZlciI6ImxvY2FsIiwiY3JlYXRlZEF0IjoiMjAyMC0xMS0wM1QwODozMzozNy4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMC0xMS0wM1QwODozMzozNy4wMDBaIiwiaWF0IjoxNjA0NDgxMTIzfQ.p4nu83YEYOTD5NB7XKkqJTyAlgKDu6EPVgLMQqHQ_RY"]
    
    init() {
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

