
import Foundation
import Alamofire

class IssueListService {
    
    // TODO: 이 url들을 common service에 옮겨서 한번에 관리하자.
    
    // 마지막 값만 이넘값으로 수정하자. -  이넘 값들 common Service에 모아도 될듯!
    
    let port: Int = 49203
    lazy var issueAPIURL = "http://group05issuetracker.duckdns.org:\(port)/api/issue/"
 
//    let httpHeaders:HTTPHeaders = ["Accept": "application/json",
//                                   "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjExLCJ1c2VySWQiOiJhYWExMTEiLCJwYXNzd29yZCI6IiQyYiQxMiRFQmIxMDBuckJCRTZZSDhXSWNvam5PS3d5YlYzSUQ1VHE4U2x6RWxnRWdXUm0xRU9TOVQzMiIsIm5pY2tuYW1lIjoiYWFhMTExIiwiT0F1dGgiOmZhbHNlLCJyZXNvdXJjZVNlcnZlciI6ImxvY2FsIiwiY3JlYXRlZEF0IjoiMjAyMC0xMS0wM1QwODozMzozNy4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMC0xMS0wM1QwODozMzozNy4wMDBaIiwiaWF0IjoxNjA0NDgxMTIzfQ.p4nu83YEYOTD5NB7XKkqJTyAlgKDu6EPVgLMQqHQ_RY"]
    
    let httpHeaders:HTTPHeaders = ["Accept": "application/json",
                                       "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjE3LCJ1c2VySWQiOiJ0ZXN0SWQxIiwicGFzc3dvcmQiOiIkMmIkMTIkME4ucWNLU09XYm9EcFI1RjZnenNydTd5L0pqV3VtTnRmUE02Tjl6ZTZ6NDBFQkxvdUNHc3kiLCJuaWNrbmFtZSI6InRlc3ROaWNrbmFtZTEiLCJPQXV0aCI6ZmFsc2UsInJlc291cmNlU2VydmVyIjoibG9jYWwiLCJjcmVhdGVkQXQiOiIyMDIwLTExLTA1VDEyOjE3OjA5LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIwLTExLTA1VDEyOjE3OjA5LjAwMFoiLCJpYXQiOjE2MDQ1NzkwNDF9.Jq_zpkUT9VejHkwrtDh8Sa1uRguV82Mw6uorKViBPfg"]
    
    //
        
        
        
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
                    
                    print(result)
                    
                    let resultData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                    print(resultData)
                    
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

        let issueParameter = ["isOpen": "\(false)"]
        
        AF.request(issueAPIURL + "\(issueId)",
                   method: .patch,
                   parameters: issueParameter,
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
                    print(String(data: data, encoding: .utf8))
                    weakSelf.requestIssueData()
                    print("success",data)
                case .failure(let error):
                    print("error",error)
                }
            }
        
    }
}
