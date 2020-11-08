
import Foundation
import Alamofire

class IssueDetailViewModel {
    
    lazy var service = IssueDetailService(viewModel: self)
    
    struct Status {
        var model = Bindable(IssueDetailModel.all()) // 여기에 snapshot 연결
//        var assignee
//        var label
    }
    
    struct Action {
        // Edit 버튼
        // 스와이프
        // 댓글 추가 버튼
        // 스크롤 버튼
    }
    
    var status: Status
    //var action: Action
  
    var issueId: Int
 
    init(issueId: Int) {
        self.status = Status()
        self.issueId = issueId
        service.callAPI(with: issueId)
    }

    
}
