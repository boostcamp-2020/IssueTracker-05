import Foundation

class MultiSelectiveEditingViewModel {
    
    lazy var service = MultiSelectiveEditingService(viewModel: self)
    
    var countOfSelectedTitle: String {
        "\(self.status.issues.value.filter { $0.isSelected }.count)개 선택"
    }
    
    
    struct Status {
        var issues: Bindable<[IssueListModel]>
        var title = Bindable("0개 선택")
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
                    issues[index].isSelected.toggle()
                }
            }
            weakSelf.status.issues.value = issues // 발생
            weakSelf.status.title.value = weakSelf.countOfSelectedTitle
        }, closeSelectedIssues: { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.status.issues.value.forEach {
                weakSelf.service.requestIssueClose(issueId: $0.iid)
            }
            weakSelf.status.title.value = weakSelf.countOfSelectedTitle
        }, selectAll: { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.status.issues.value
                = weakSelf.status.issues.value.map {
                    var tempIssue = $0
                    tempIssue.isSelected = true
                    return tempIssue
                }
            weakSelf.status.title.value = weakSelf.countOfSelectedTitle
        }, deSelectAll: { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.status.issues.value
                = weakSelf.status.issues.value.map {
                    var tempIssue = $0
                    tempIssue.isSelected = false
                    return tempIssue
                }
            weakSelf.status.title.value = weakSelf.countOfSelectedTitle
        }
    )
    
    init(issues: [IssueListModel]) {
        status = Status(issues: Bindable(issues))
    }
    
}
