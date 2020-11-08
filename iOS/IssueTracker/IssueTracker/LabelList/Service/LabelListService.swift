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
   
}
