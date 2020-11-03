
import Foundation

class SearchListViewModel {
        
    struct Status {
        var model = Bindable(IssueListModel.all())
    }
    
    struct Action {
        var searchTextChanged: (String) -> Void
    }
    
    var status = Status()
    var originModel: [IssueListModel] // viewController에서 받아온 원본 데이터 - 뷰컨트롤러 생성하면서 받아 온다.
    lazy var action = Action(searchTextChanged: search)
    
    init(originModel: [IssueListModel]) {
        self.originModel = originModel
    }
    
    func search(text: String) {
        status.model.value = originModel.filter {
            $0.title.contains(text)
        }
    }
    
    
}
