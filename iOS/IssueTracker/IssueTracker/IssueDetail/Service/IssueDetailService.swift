import Foundation
import Alamofire

class IssueDetailService {
    
    let url = "http://group05issuetracker.duckdns.org:49203"
//    let headers: HTTPHeaders = ["Accept": "application/json","Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjExLCJ1c2VySWQiOiJhYWExMTEiLCJwYXNzd29yZCI6IiQyYiQxMiRFQmIxMDBuckJCRTZZSDhXSWNvam5PS3d5YlYzSUQ1VHE4U2x6RWxnRWdXUm0xRU9TOVQzMiIsIm5pY2tuYW1lIjoiYWFhMTExIiwiT0F1dGgiOmZhbHNlLCJyZXNvdXJjZVNlcnZlciI6ImxvY2FsIiwiY3JlYXRlZEF0IjoiMjAyMC0xMS0wM1QwODozMzozNy4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMC0xMS0wM1QwODozMzozNy4wMDBaIiwiaWF0IjoxNjA0NDgxMTIzfQ.p4nu83YEYOTD5NB7XKkqJTyAlgKDu6EPVgLMQqHQ_RY"]
    
    let headers: HTTPHeaders = ["Accept": "application/json","Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjE3LCJ1c2VySWQiOiJ0ZXN0SWQxIiwicGFzc3dvcmQiOiIkMmIkMTIkME4ucWNLU09XYm9EcFI1RjZnenNydTd5L0pqV3VtTnRmUE02Tjl6ZTZ6NDBFQkxvdUNHc3kiLCJuaWNrbmFtZSI6InRlc3ROaWNrbmFtZTEiLCJPQXV0aCI6ZmFsc2UsInJlc291cmNlU2VydmVyIjoibG9jYWwiLCJjcmVhdGVkQXQiOiIyMDIwLTExLTA1VDEyOjE3OjA5LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIwLTExLTA1VDEyOjE3OjA5LjAwMFoiLCJpYXQiOjE2MDQ1NzkwNDF9.Jq_zpkUT9VejHkwrtDh8Sa1uRguV82Mw6uorKViBPfg"]
    
    unowned let viewModel: IssueDetailViewModel
    
    init(viewModel: IssueDetailViewModel) {
        self.viewModel = viewModel
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
