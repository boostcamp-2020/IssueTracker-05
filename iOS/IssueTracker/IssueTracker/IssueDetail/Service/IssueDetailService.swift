import Foundation
import Alamofire

class IssueDetailService {
    
    let url = "http://group05issuetracker.duckdns.org:49203"
    
    let headers: HTTPHeaders
    
    unowned let viewModel: IssueDetailViewModel
    
    init(viewModel: IssueDetailViewModel) {
        self.viewModel = viewModel
        headers
            = ["Accept": "application/json",
               "Authorization": "Bearer \(UserDefaults.standard.string(forKey: "token")!)"]
    }
    
    func callAPI(with issueId: Int) {
        let parameters = ["issueID": String(issueId)]
        
        AF.request(url + "/api/issue/\(issueId)", method: .get, parameters: parameters, headers: headers).responseJSON { [weak self] (response) in
            
            guard let weakSelf = self else { return }
            
            switch response.result {
            case .success(let result):
                do {
                    print(result)
                    let resultData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                    let decodedData = try JSONDecoder().decode(IssueDetailModel.self, from: resultData)
                    
                    weakSelf.viewModel.status.model.value = decodedData
                    
                } catch {
                    print(error)
                }
            case .failure(let error):
                print("error\nerror\n error\n error\n error\n error\n error\n error\n error ")
                print(error)
            }
        }
    }
}
