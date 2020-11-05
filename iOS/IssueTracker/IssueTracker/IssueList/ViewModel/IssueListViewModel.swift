
import Foundation

class IssueListViewModel {
    
    lazy var service = IssueListService(viewModel: self)
    
    struct Status {
        var issues =  Bindable(IssueListModel.all())
        var searchResultTitleList = Bindable([String]())
        var searchResultList = Bindable(IssueListModel.all())
    }
    
    struct Action {
        var searchTextChanged: (String) -> Void
        var searchButtonClicked: (String) -> Void
        var searchCancelButtonClicked: () -> Void
        var closeButtonTabbed: (Int) -> Void
        var deleteButtonTabbed: (Int) -> Void
    }
    
    var status = Status()
    lazy var action = Action(
        searchTextChanged: { [weak self] (newText) -> Void in
            guard let weakSelf = self else { return }
            weakSelf.status.searchResultTitleList.value
                = weakSelf.status.issues.value.filter {
                    $0.title.contains(newText)
                }.reduce([String()], { (uniqueTitleList, issueListModel) in
                    if !uniqueTitleList.contains(issueListModel.title) {
                        return uniqueTitleList + [issueListModel.title]
                    }
                    return uniqueTitleList
                })
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
            weakSelf.service.requestIssueData()
        }, closeButtonTabbed: { iid in
            print(iid, "close")
        }, deleteButtonTabbed: { iid in
            print(iid, "delete")
        })
    
    init() {
        service.requestIssueData()
        status.issues.bindAndFire(updateResultListView)
    }
    
    func updateResultListView(issues: [IssueListModel]) {
        status.searchResultList.value = issues
    }
    
    
    
}
