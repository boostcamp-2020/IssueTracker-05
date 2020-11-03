
import Foundation
import Alamofire

class IssueListViewModel {
    
    struct Status {
        var model =  Bindable(IssueListModel.all())
    }
    
    //TODO: 여기서 서버로부터 데이터를 받아온다. 서비스 객체가 여기에 존재. - 아직은 아웃풋 데이터 발생만 발생할 것으로 예상된다.
    
    let url = "http://172.30.1.27:5000/api/issue"
    let httpHeaders:HTTPHeaders = ["Accept": "application/json"]
    
    init() {
        AF.request(url, method: .get, parameters: nil, headers: httpHeaders).responseJSON { (response) in
            switch response.result {
            case .success(let result):
                do {
                    let resultData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                    let decodedData = try JSONDecoder().decode([IssueListModel].self, from: resultData)
                    self.status.model.value = decodedData
                    print(self.status.model.value)
                } catch {
                    print(error)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    
    }
    
//    struct Action {
//        func search: (String) -> Void
//    }
    
    var status = Status()
    //var Action = Action()
    
}
