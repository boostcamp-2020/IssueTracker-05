
import Foundation
import Alamofire

class IssueListViewModel {
    
    struct Status {
        var issues =  Bindable(IssueListModel.all())
        var searchResultTitleList = Bindable([String]())        // searchTitleList의 apply 바인딩
        var searchResultList = Bindable(IssueListModel.all())   // searchResultLis의 apply 바인딩
    }
    
    struct Action {
        var searchTextChanged: (String) -> Void
        var searchButtonClicked: (String) -> Void
        var searchCancelButtonClicked: () -> Void
    }
    
    var status = Status()
    lazy var action = Action(
        searchTextChanged: { [weak self] (newText) -> Void in
            guard let weakSelf = self else { return }
            weakSelf.status.searchResultTitleList.value
                = weakSelf.status.issues.value.filter {
                    $0.title.contains(newText)
                }.map {
                    $0.title
                }
        },searchButtonClicked: { [weak self] searchBarText in
            guard let weakSelf = self else { return }
            weakSelf.status.searchResultList.value
                = weakSelf.status.issues.value.filter {
                    $0.title.contains(searchBarText)
                }
        },searchCancelButtonClicked: { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.status.searchResultList.value
                = weakSelf.status.issues.value
            weakSelf.requestIssueData()
        })
    
    let url = "http://172.30.1.27:5000/api/issue"
    let httpHeaders:HTTPHeaders = ["Accept": "application/json"]
    
    init() {
        requestIssueData()
        status.issues.bindAndFire(updateResultListView)
    }
    
    func updateResultListView(issues: [IssueListModel]) {
        status.searchResultList.value = issues
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
