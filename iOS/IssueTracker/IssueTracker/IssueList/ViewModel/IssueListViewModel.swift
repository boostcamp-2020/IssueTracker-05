
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
    
    let url = "http://group05issuetracker.duckdns.org:49203/api/issue"
    let httpHeaders:HTTPHeaders = ["Accept": "application/json","Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjExLCJ1c2VySWQiOiJhYWExMTEiLCJwYXNzd29yZCI6IiQyYiQxMiRFQmIxMDBuckJCRTZZSDhXSWNvam5PS3d5YlYzSUQ1VHE4U2x6RWxnRWdXUm0xRU9TOVQzMiIsIm5pY2tuYW1lIjoiYWFhMTExIiwiT0F1dGgiOmZhbHNlLCJyZXNvdXJjZVNlcnZlciI6ImxvY2FsIiwiY3JlYXRlZEF0IjoiMjAyMC0xMS0wM1QwODozMzozNy4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMC0xMS0wM1QwODozMzozNy4wMDBaIiwiaWF0IjoxNjA0NDgxMTIzfQ.p4nu83YEYOTD5NB7XKkqJTyAlgKDu6EPVgLMQqHQ_RY"]
    
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
