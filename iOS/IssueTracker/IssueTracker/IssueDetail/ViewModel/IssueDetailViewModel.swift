
import Foundation
import Alamofire
class IssueDetailViewModel {
    struct Status {
        var model =  Bindable<[Comment]>([Comment]()) // 여기에 snapshot 연결
    }
    
    struct Action {
        // Edit 버튼
        // 스와이프
        // 댓글 추가 버튼
        // 스크롤 버튼
    }
    
    var status: Status
    //var action: Action
  
    var iid: Int
    
//    init(model: [Comment]) {
//        self.status = Status(model: Bindable(model))
//    }
//
    init(iid: Int) {
        self.status = Status()
        self.iid = iid
        callAPI()
    }

    func callAPI() {
        let url = "http://group05issuetracker.duckdns.org:49203"
        
        let parameters = ["issueID": String(self.iid)]

        let headers: HTTPHeaders = ["Accept": "application/json","Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjExLCJ1c2VySWQiOiJhYWExMTEiLCJwYXNzd29yZCI6IiQyYiQxMiRFQmIxMDBuckJCRTZZSDhXSWNvam5PS3d5YlYzSUQ1VHE4U2x6RWxnRWdXUm0xRU9TOVQzMiIsIm5pY2tuYW1lIjoiYWFhMTExIiwiT0F1dGgiOmZhbHNlLCJyZXNvdXJjZVNlcnZlciI6ImxvY2FsIiwiY3JlYXRlZEF0IjoiMjAyMC0xMS0wM1QwODozMzozNy4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMC0xMS0wM1QwODozMzozNy4wMDBaIiwiaWF0IjoxNjA0NDgxMTIzfQ.p4nu83YEYOTD5NB7XKkqJTyAlgKDu6EPVgLMQqHQ_RY"]
        
        AF.request(url + "/api/issue/\(self.iid)", method: .get, parameters: parameters, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let result):
                do {
//                    self.status.model.value = Comment.all()
                    print(result)
                    let resultData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                    let decodedData = try JSONDecoder().decode(IssueDetailModel.self, from: resultData)
                    self.status.model.value = decodedData.comments!
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            default: break
            }
        }
    }
    
    
}
