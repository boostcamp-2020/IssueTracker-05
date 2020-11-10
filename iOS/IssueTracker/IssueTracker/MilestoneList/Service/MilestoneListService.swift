import Foundation
import Alamofire

class MilestoneListService {
    
    let port: Int = 49203
    lazy var issueAPIURL = "http://group05issuetracker.duckdns.org:\(port)/api/milestone/"
    let httpHeaders:HTTPHeaders
    
    unowned var viewModel: MilestoneListViewModel
    
    init(viewModel: MilestoneListViewModel){
        self.viewModel = viewModel
        httpHeaders
            = ["Accept": "application/json",
               "Authorization": "Bearer \(UserDefaults.standard.string(forKey: "token")!)"]
    }
    
    
    //MARK: GET
    
    func requestMilestoneGet() {
        
        AF.request(issueAPIURL,
                   method: .get,
                   parameters: nil,
                   headers: httpHeaders)
            .responseJSON { [weak self] (response) in
                guard let weakSelf = self else { return }
                switch response.result {
                case .success(let result):
                    do {
                        let resultData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                        let decodedData = try JSONDecoder().decode([Milestone].self, from: resultData)
                        
                        weakSelf.viewModel.status.milestones.value = decodedData
                        print(decodedData[0].updatedAt)
                        
                    } catch {
                        print(error)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    
    // MARK: PATCH - 수정
    
    func requestMilestonePatch(id: Int, title: String, desc: String, date: String) {
        
        let parameters = [
            "title": "\(title)",
            "dueDate": "\(date)",
            "content": "\(desc)"
        ]
        
        AF.request(issueAPIURL + "\(id)",
                   method: .patch,
                   parameters: parameters,
                   headers: httpHeaders)
            .responseJSON { [weak self] (response) in
                guard let weakSelf = self else { return }
                weakSelf.requestMilestoneGet()
                switch response.result {
                case .success(let result):
                    do {
                        // TODO: 확인용. 나중에 삭제해야 한다.
                        let resultData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                        guard let data = String(data: resultData, encoding: .utf8) else { return }
                        print(data)
                    } catch {
                        print(error)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    
    // MARK: POST - 추가, 생성
    
    func requestMilestonePost(title: String, desc: String, date: String) {
        
        let parameters = [
            "title":"\(title)",
            "dueDate":"\(date)",
            "content":"\(desc)"
        ]
        
        AF.request(issueAPIURL,
                   method: .post,
                   parameters: parameters,
                   headers: httpHeaders)
            .response { [weak self] _ in
                guard let weakSelf = self else { return }
                weakSelf.requestMilestoneGet()
            }
    }
    
    
    // MARK: DELETE
    
    func requestMilestoneDelete(id: Int) {
        
        AF.request(issueAPIURL + "\(id)",
                   method: .delete,
                   parameters: nil,
                   headers: httpHeaders)
            .responseJSON { [weak self] (response) in
                guard let weakSelf = self else { return }
                weakSelf.requestMilestoneGet()
                switch response.result {
                case .success(let result):
                    print(result)
                    do {
                        let resultData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                        guard let data = String(data: resultData, encoding: .utf8) else { return }
                        print(data)
                    } catch {
                        print(error)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
}
