import Foundation

class MultiSelectiveEditingViewModel {
    
    struct Status {
        var issues: Bindable<[IssueListModel]>
    }
    
    struct Action {
        
    }
    
    var status: Status
    
    init(issues: [IssueListModel]) {
        status = Status(issues: Bindable(issues))
    }
    
}
