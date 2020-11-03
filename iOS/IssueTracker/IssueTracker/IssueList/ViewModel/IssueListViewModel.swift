
import Foundation
import Alamofire

class IssueListViewModel {
    
    struct Status {
        var issues =  Bindable(IssueListModel.all())
        var searchResultList = Bindable(IssueListModel.all())
        var searchResultTitleList = Bindable([String]())
    }
    
    struct Action {
        var searchTextChanged: (String) -> Void
        var searchButtonClicked: (String) -> Void
        //var searchCancelButtonClicked: () -> Void
    }
    
    var status = Status()
    lazy var action = Action(
        searchTextChanged: { (text) -> Void in
            self.status.searchResultTitleList.value
                = self.status.issues.value.filter {
                    $0.title.contains(text)
                }.map {
                    $0.title
                }
        },searchButtonClicked: { searchBarText in
            self.status.searchResultList.value
                = self.status.issues.value.filter {
                    $0.title == searchBarText
                }
        } )
    
    let url = "http://172.30.1.27:5000/api/issue"
    let httpHeaders:HTTPHeaders = ["Accept": "application/json"]
    
    init() {
        requestIssueData()
    }
    
    func requestIssueData() {
        // 검색 결과 화면에서 돌아오면 다시 호출해 주어야 한다.
        AF.request(url, method: .get, parameters: nil, headers: httpHeaders).responseJSON { (response) in
            switch response.result {
            case .success(let result):
                do {
                    let resultData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                    let decodedData = try JSONDecoder().decode([IssueListModel].self, from: resultData)
                    self.status.issues.value = decodedData
                    print(self.status.issues.value)
                } catch {
                    print(error)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
