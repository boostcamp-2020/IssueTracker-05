import Foundation
import Alamofire


// get, pose 잘됨.

// Patch 문제 있음.

class LabelListService {
    
    let port: Int = 49203
    lazy var issueAPIURL = "http://group05issuetracker.duckdns.org:\(port)/api/label/"
    
    let httpHeaders:HTTPHeaders
    
    unowned var viewModel: LabelListViewModel
    
    init(viewModel: LabelListViewModel){
        self.viewModel = viewModel
        httpHeaders
            = ["Accept": "application/json",
               "Authorization": "Bearer \(UserDefaults.standard.string(forKey: "token")!)"]
    }
    
    //MARK: GET
    func requestLabelListGet() {
        // 검색 결과 화면에서 돌아오면 다시 호출해 주어야 한다.
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
                        let decodedData = try JSONDecoder().decode([Label].self, from: resultData)
                        weakSelf.viewModel.status.labels.value = decodedData
                    } catch {
                        print(error)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    // MARK: label 수정
    func requestLabelPatch(oldName: String, name: String, desc: String, color: String) {
        
        let parameters = [
            "name": "\(name)",
            "color": "\(color)",
            "desc": "\(desc)"
        ]
        
        AF.request(issueAPIURL + "\(oldName)",
                   method: .patch,
                   parameters: parameters,
                   headers: httpHeaders)
            .responseJSON { [weak self] (response) in
                guard let weakSelf = self else { return }
                switch response.result {
                case .success(let result):
                    print(result)
                    do {
                        let resultData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                        print(String(data: resultData, encoding: .utf8))
                        weakSelf.requestLabelListGet()
                    } catch {
                        print(error)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    
    // MARK: label 추가, 생성
    func requestLabelPost(name: String, desc: String, color: String) {
        
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
                weakSelf.requestLabelListGet()
            }
    }
    
    // MARK: Delete
    func requestLabelDelete(name: String) {
        AF.request(issueAPIURL + "\(name)",
                   method: .delete,
                   parameters: nil,
                   headers: httpHeaders)
            .response{ [weak self] _ in
                guard let weakSelf = self else { return }
                weakSelf.requestLabelListGet()
            }
    }
    
}

