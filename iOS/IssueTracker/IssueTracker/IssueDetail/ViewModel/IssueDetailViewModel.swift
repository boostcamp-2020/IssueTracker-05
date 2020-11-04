
import Foundation

class IssueDetailViewModel {
    struct Status {
        var model: Bindable<[Comment]> // 여기에 snapshot 연결
    }
    
    struct Action {
        // Edit 버튼
        // 스와이프
        // 댓글 추가 버튼
        // 스크롤 버튼
    }
    
    var status: Status
    //var action: Action
    
    init(model: [Comment]) {
        self.status = Status(model: Bindable(model))
    }
    
}
