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
                    } catch {
                        print(error)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    
    // MARK: PATCH - 수정
    
    func requestMilestonePatch(oldName: String, name: String, desc: String, color: String) {
        
        guard let url = (issueAPIURL + "\(oldName)").addingPercentEncoding(
                withAllowedCharacters: .urlQueryAllowed) else { return }
        
        let parameters = [
            "name": "\(name)",
            "color": "\(color)",
            "desc": "\(desc)"
        ]
        
        AF.request(url,
                   method: .patch,
                   parameters: parameters,
                   headers: httpHeaders)
            .responseJSON { [weak self] (response) in
                guard let weakSelf = self else { return }
                //weakSelf.requestLabelListGet()
                switch response.result {
                case .success(let result):
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
    
    
    // MARK: POST - 추가, 생성
    
    func requestMilestonePost(name: String, desc: String, color: String) {
        
        let parameters = [
            "name":"\(name)",
            "desc":"\(desc)",
            "color":"\(color)"
        ]
        
        AF.request(issueAPIURL,
                   method: .post,
                   parameters: parameters,
                   headers: httpHeaders)
            .response { [weak self] _ in
                guard let weakSelf = self else { return }
                //weakSelf.requestLabelListGet()
            }
    }
    
    
    // MARK: DELETE
    
    func requestMilestoneDelete(name: String) {
        
        guard let url = (issueAPIURL + "\(name)").addingPercentEncoding(
                withAllowedCharacters: .urlQueryAllowed) else { return }
        
        AF.request(url,
                   method: .delete,
                   parameters: nil,
                   headers: httpHeaders)
            .responseJSON { [weak self] (response) in
                guard let weakSelf = self else { return }
                //weakSelf.requestLabelListGet()
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
