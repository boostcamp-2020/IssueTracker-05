
import Foundation
import Alamofire

class IssueListService {
    
    // TODO: 이 url들을 common service에 옮겨서 한번에 관리하자.
    
    // 마지막 값만 이넘값으로 수정하자. -  이넘 값들 common Service에 모아도 될듯!
    
    let issueAPIURL = "http://group05issuetracker.duckdns.org:49203/api/issue"
 
    let httpHeaders:HTTPHeaders = ["Accept": "application/json","Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjExLCJ1c2VySWQiOiJhYWExMTEiLCJwYXNzd29yZCI6IiQyYiQxMiRFQmIxMDBuckJCRTZZSDhXSWNvam5PS3d5YlYzSUQ1VHE4U2x6RWxnRWdXUm0xRU9TOVQzMiIsIm5pY2tuYW1lIjoiYWFhMTExIiwiT0F1dGgiOmZhbHNlLCJyZXNvdXJjZVNlcnZlciI6ImxvY2FsIiwiY3JlYXRlZEF0IjoiMjAyMC0xMS0wM1QwODozMzozNy4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMC0xMS0wM1QwODozMzozNy4wMDBaIiwiaWF0IjoxNjA0NDgxMTIzfQ.p4nu83YEYOTD5NB7XKkqJTyAlgKDu6EPVgLMQqHQ_RY"]
    
    unowned var viewModel: IssueListViewModel
    
    init(viewModel: IssueListViewModel){
        self.viewModel = viewModel
    }
    
    //MARK: GET
    func requestIssueData() {
        // 검색 결과 화면에서 돌아오면 다시 호출해 주어야 한다.
        AF.request(issueAPIURL, method: .get, parameters: nil, headers: httpHeaders).responseJSON
        { [weak self] (response) in
            guard let weakSelf = self else { return }
            switch response.result {
            case .success(let result):
                do {
                    let resultData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                    let decodedData = try JSONDecoder().decode([IssueListModel].self, from: resultData)
                    weakSelf.viewModel.status.issues.value = decodedData
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: POST
    func requestCloaseIssue(issueId: Int) {
        
        var newIssue: IssueListModel?
        
        for index in viewModel.status.issues.value.indices {
            if viewModel.status.issues.value[index].iid == issueId {
                newIssue = viewModel.status.issues.value[index]
            }
        }
        
        guard var issue = newIssue else { return }
        issue.isOpen = false
        
        AF.request(issueAPIURL + "\(issueId)",
                   method: .post,
                   parameters: issue,
                   headers: httpHeaders)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    print("success",data)
                case .failure(let error):
                    print("error",error)
                }
            }
    }
    
    //MARK: DELETE
    func requestDeleteIssue(issueId: Int) {
        AF.request(issueAPIURL + "\(issueId)",
                   method: .delete,
                   headers: httpHeaders)
            .responseData { [weak self] response in
                guard let weakSelf = self else { return }
                switch response.result {
                case .success(let data):
                    weakSelf.requestIssueData()
                    print("success",data)
                case .failure(let error):
                    print("error",error)
                }
            }
        
    }
}
