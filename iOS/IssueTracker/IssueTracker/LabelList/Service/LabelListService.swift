import Foundation
import Alamofire

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
    func requestLabelListData() {
        // 검색 결과 화면에서 돌아오면 다시 호출해 주어야 한다.
        AF.request(issueAPIURL, method: .get, parameters: nil, headers: httpHeaders).responseJSON
        { [weak self] (response) in
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
    func requestEditLabel() {
        // 검색 결과 화면에서 돌아오면 다시 호출해 주어야 한다.
        AF.request(issueAPIURL, method: .get, parameters: nil, headers: httpHeaders).responseJSON
        { [weak self] (response) in
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
    
    // MARK: label 추가
    func requestAddLabel(name: String, desc: String, color: String) {
        
        let parameters = [
            "name":"\(name)",
            "desc":"\(desc)",
            "color":"\(color)"
        ]
        
        AF.request(issueAPIURL, method: .post,
                   parameters: parameters,
                   headers: httpHeaders)
            .responseJSON { [weak self] (response) in
            guard let weakSelf = self else { return }
            switch response.result {
            case .success(let result):
                weakSelf.requestLabelListData()
                do {
                    let resultData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                    let decodedData = try JSONDecoder().decode([Label].self, from: resultData)
                    print(decodedData) // TODO: 나중에 삭제
                } catch { // 응답 내용 파싱 실패
                    print(error)
                }
            case .failure(let error): // 아애 응답을 못받음
                print(error.localizedDescription)
            }
        }
    }
    
    /*
     {
         name: "[현재 입력한 레이블 명]",
         desc: null or "[현재 입력한 레이블에 대한 설명]",
         color: "[레이블 색상]"
     }
     */
    
}
