import Foundation
import Alamofire

class MultiSelectiveEditingService {
    
    let port: Int = 49203
    lazy var issueAPIURL = "http://group05issuetracker.duckdns.org:\(port)/api/issue/"
    
    let httpHeaders: HTTPHeaders
    
    unowned var viewModel: MultiSelectiveEditingViewModel
    
    init(viewModel: MultiSelectiveEditingViewModel) {
        self.viewModel = viewModel
        httpHeaders
            = ["Accept": "application/json",
               "Authorization": "Bearer \(UserDefaults.standard.string(forKey: "token")!)"]
    }
    
    //MARK: POST
    func requestIssueClose(issueId: Int) {
        
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
    
}
