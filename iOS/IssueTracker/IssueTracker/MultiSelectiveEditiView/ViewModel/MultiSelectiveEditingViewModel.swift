import Foundation

class MultiSelectiveEditingViewModel {
    
    lazy var service = MultiSelectiveEditingService(viewModel: self)
    
    struct Status {
        var issues: Bindable<[IssueListModel]>
        //var selectButtonTitle: Bindable<String>("Select All")
        // selectedCount -> title로 사용 - 선택할 때 마다 얘를 업데이트 해준다. 긜고 타이틀 변경함수를 바인딩해 놓는다.
    }
    
    struct Action {
        var cellTouched: (Int) -> Void // 같은 게 있으면 지움 -> 필터로 어케 될 듯?
        var closeSelectedIssues: () -> Void
        var selectAll: () -> Void
        var deSelectAll: () -> Void
    }
    
    var status: Status
    lazy var action = Action(
        cellTouched: { [weak self] id in
            guard let weakSelf = self else { return }
            var issues = weakSelf.status.issues.value
            for index in issues.indices {
                if issues[index].iid == id {
                    print("여기인가\(id)")
                    issues[index].isSelected.toggle()
                }
            }
            weakSelf.status.issues.value = issues // 발생
        }, closeSelectedIssues: { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.status.issues.value.forEach {
                weakSelf.service.requestIssueClose(issueId: $0.iid)
            }
        }, selectAll: { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.status.issues.value
                = weakSelf.status.issues.value.map {
                    var tempIssue = $0
                    tempIssue.isSelected = true
                    return tempIssue
                }
        }, deSelectAll: { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.status.issues.value
                = weakSelf.status.issues.value.map {
                    var tempIssue = $0
                    tempIssue.isSelected = false
                    return tempIssue
                }
        }
    )
    
    init(issues: [IssueListModel]) {
        status = Status(issues: Bindable(issues))
    }
    
}
