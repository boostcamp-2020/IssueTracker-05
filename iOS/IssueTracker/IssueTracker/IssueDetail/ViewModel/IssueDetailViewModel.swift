
import Foundation
import Alamofire

class IssueDetailViewModel {
    
    lazy var service = IssueDetailService(viewModel: self)
    
    struct Status {
        var model = Bindable(IssueDetailModel.all()) // 여기에 snapshot 연결
    }
    
    struct Action {
        var refreshData: () -> Void
        //var editIssueTabbed: (Int) -> Void
    }
    
    var status: Status
    lazy var action = Action(
        refreshData: { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.service.requestIssueGet(with: weakSelf.issueId)
        }
    )
  
    var issueId: Int
 
    init(issueId: Int) {
        self.status = Status()
        self.issueId = issueId
        service.requestIssueGet(with: issueId)
    }

    
}
