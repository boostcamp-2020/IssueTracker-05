
import Foundation
import Alamofire

class MilestoneListService {
    
    unowned var viewModel: MilestoneListViewModel
    
    let url = "http://group05issuetracker.duckdns.org:49203/api/milestone"
    let httpHeaders:HTTPHeaders
    
    init(viewModel: MilestoneListViewModel) {
        self.viewModel = viewModel
        httpHeaders
            = ["Accept": "application/json",
               "Authorization": "Bearer \(UserDefaults.standard.string(forKey: "token")!)"]
        requestMilestoneData()
    }
    
    func requestMilestoneData() {
        // 검색 결과 화면에서 돌아오면 다시 호출해 주어야 한다.
        AF.request(url, method: .get, parameters: nil, headers: httpHeaders).responseJSON { [weak self] (response) in
            guard let weakSelf = self else { return }
            switch response.result {
            case .success(let result):
                do {
                    let resultData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                    let decodedData = try JSONDecoder().decode([Milestone].self, from: resultData)
                    
//                    self.viewModel.status.issues.value = decodedData
//                    
//                    print(weakSelf.status.issues.value)
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
