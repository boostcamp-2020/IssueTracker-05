
import Foundation
import Alamofire

class IssueListService {
    
    // TODO: 이 url들을 common service에 옮겨서 한번에 관리하자.
    
    // 마지막 값만 이넘값으로 수정하자. -  이넘 값들 common Service에 모아도 될듯!
    
    let port: Int = 49203
    lazy var issueAPIURL = "http://group05issuetracker.duckdns.org:\(port)/api/issue/"
    
    let httpHeaders:HTTPHeaders
    
    unowned var viewModel: IssueListViewModel
    
    init(viewModel: IssueListViewModel){
        self.viewModel = viewModel
        httpHeaders
            = ["Accept": "application/json",
               "Authorization": "Bearer \(UserDefaults.standard.string(forKey: "token")!)"]
        
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
    
    //MARK: ADD
    func requestAddIssue(issueId: Int) {
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
